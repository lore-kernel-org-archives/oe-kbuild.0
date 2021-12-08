Content-Type: multipart/mixed; boundary="===============6352138992271467189=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pci/controller/pcie-apple.c:177:33: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
Date: Wed, 08 Dec 2021 11:15:44 +0800
Message-ID: <202112081140.7MWl5B2K-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6352138992271467189==
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
head:   cd8c917a56f20f48748dd43d9ae3caff51d5b987
commit: d8fcbe52d7d382106ab1dfa89c4b6a4952524125 PCI: apple: Add INTx and p=
er-port interrupt support
date:   5 weeks ago
:::::: branch date: 27 hours ago
:::::: commit date: 5 weeks ago
compiler: sparc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> kernel/bpf/bpf_iter.c:456:12: warning: Boolean result is used in bitwise=
 operation. Clarify expression with parentheses. [clarifyCondition]
    if (!ulen ^ !ubuf)
              ^
   kernel/bpf/bpf_iter.c:517:29: warning: Boolean result is used in bitwise=
 operation. Clarify expression with parentheses. [clarifyCondition]
    if (bpfptr_is_null(ulinfo) ^ !linfo_len)
                               ^
>> drivers/pci/controller/pcie-apple.c:177:33: warning: Boolean result is u=
sed in bitwise operation. Clarify expression with parentheses. [clarifyCond=
ition]
    if (hwirq_is_intx(data->hwirq) ^ !!(type & IRQ_TYPE_LEVEL_MASK))
                                   ^
>> drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:964:14: warning: Boolea=
n result is used in bitwise operation. Clarify expression with parentheses.=
 [clarifyCondition]
     if (pullup ^ !t)
                ^
>> drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:286:2: warning: Address=
 of local auto-variable assigned to a function parameter. [autoVariables]
    *gpio_chip =3D &hw->chip;
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
--===============6352138992271467189==--

