Content-Type: multipart/mixed; boundary="===============6361023236023234977=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pci/controller/pcie-apple.c:177:33: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
Date: Sat, 29 Jan 2022 15:34:06 +0800
Message-ID: <202201291504.zzu6kNQf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6361023236023234977==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Marc Zyngier <maz@kernel.org>
CC: Bjorn Helgaas <helgaas@kernel.org>
CC: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   169387e2aa291a4e3cb856053730fe99d6cec06f
commit: d8fcbe52d7d382106ab1dfa89c4b6a4952524125 PCI: apple: Add INTx and p=
er-port interrupt support
date:   3 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 3 months ago
compiler: riscv32-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/pci/controller/pcie-apple.c:177:33: warning: Boolean result is u=
sed in bitwise operation. Clarify expression with parentheses. [clarifyCond=
ition]
    if (hwirq_is_intx(data->hwirq) ^ !!(type & IRQ_TYPE_LEVEL_MASK))
                                   ^

vim +177 drivers/pci/controller/pcie-apple.c

d8fcbe52d7d382 Marc Zyngier 2021-09-29  169  =

d8fcbe52d7d382 Marc Zyngier 2021-09-29  170  static int apple_port_irq_set_=
type(struct irq_data *data, unsigned int type)
d8fcbe52d7d382 Marc Zyngier 2021-09-29  171  {
d8fcbe52d7d382 Marc Zyngier 2021-09-29  172  	/*
d8fcbe52d7d382 Marc Zyngier 2021-09-29  173  	 * It doesn't seem that there=
 is any way to configure the
d8fcbe52d7d382 Marc Zyngier 2021-09-29  174  	 * trigger, so assume INTx ha=
ve to be level (as per the spec),
d8fcbe52d7d382 Marc Zyngier 2021-09-29  175  	 * and the rest is edge (whic=
h looks likely).
d8fcbe52d7d382 Marc Zyngier 2021-09-29  176  	 */
d8fcbe52d7d382 Marc Zyngier 2021-09-29 @177  	if (hwirq_is_intx(data->hwirq=
) ^ !!(type & IRQ_TYPE_LEVEL_MASK))
d8fcbe52d7d382 Marc Zyngier 2021-09-29  178  		return -EINVAL;
d8fcbe52d7d382 Marc Zyngier 2021-09-29  179  =

d8fcbe52d7d382 Marc Zyngier 2021-09-29  180  	irqd_set_trigger_type(data, t=
ype);
d8fcbe52d7d382 Marc Zyngier 2021-09-29  181  	return 0;
d8fcbe52d7d382 Marc Zyngier 2021-09-29  182  }
d8fcbe52d7d382 Marc Zyngier 2021-09-29  183  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6361023236023234977==--

