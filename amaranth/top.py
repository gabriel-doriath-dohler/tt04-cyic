from amaranth import *
from amaranth.cli import main

from amaranth.back import verilog
from amaranth.sim import Simulator

class Top(Elaboratable):
    def __init__(self):
        self.ui_in = Signal(8)
        self.uo_out = Signal(8)
        self.uio_in = Signal(8)
        self.uio_out = Signal(8)
        self.uio_oe = Signal(8)
        self.clk = Signal(1)
        self.ena = Signal(1)
        self.rst_n = Signal(1)


    def elaborate(self, platform):
        m = Module()
        clk_in = self.clk
        rst_in = self.rst_n
        q = Signal(6)
        o = Signal(6)
        # Set up clock domain from io_in[0] and reset from io_in[1].
        cd_sync = ClockDomain("sync")
        m.d.comb += cd_sync.clk.eq(clk_in)
        m.d.comb += cd_sync.rst.eq(rst_in)
        m.domains += cd_sync
        
        m.d.sync += q.eq(self.ui_in[2:])
        m.d.sync += q.eq(q + 1)
        m.d.sync += o.eq(Cat(q[1:] ^ q[:5], q[-1]))
        m.d.comb += self.uo_out.eq(o)
        return m

    def ports(self):
        return [top.ui_in, top.uo_out, top.uio_in, top.uio_out, top.uio_oe, top.clk, top.ena, top.rst_n]


def test():
    """
    Testcase for GRAY_COUNTER generator.

    Run using `pytest gray_gc4.py`.
    """
    ctr = Top()

    def testbench():
        yield ctr.io_in.eq(0)
        # Collect 22 output bits
        out = []
        yield
        for _ in range(22):
            out.append((yield ctr.io_out))
            yield
        assert out == [
            0,1,3,2,6,7,5,4,12,13,15,14,10,11,9,8,24,25,27,26,30,31]

    sim = Simulator(ctr)
    sim.add_clock(1/10e6)
    sim.add_sync_process(testbench)
    with sim.write_vcd("gc4.vcd", "gc4.gtkw", traces=ctr.ports()):
        sim.run()



if __name__ == "__main__":
    # Generate Verilog source for GC4.
    top = Top()
    v = verilog.convert(
        top, name="tt_um_sup3legacy_trng", ports=[top.ui_in, top.uo_out, top.uio_in,
                                            top.uio_out, top.uio_oe, top.clk,
                                            top.ena, top.rst_n],
        emit_src=False, strip_internal_attrs=True)
    with open("../src/top.v", 'w') as file:
        file.write(v)
    print(v)
