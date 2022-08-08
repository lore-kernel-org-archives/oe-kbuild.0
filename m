Content-Type: multipart/mixed; boundary="===============4334573460204535890=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] irqchip: Select downstream irqchip drivers for LoongArch CPU
Date: Mon, 08 Aug 2022 20:07:11 +0800
Message-ID: <202208082052.rYETKVqt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4334573460204535890==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "only Kconfig file updated"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220808085319.3350111-1-chenhuacai@loongson.cn>
References: <20220808085319.3350111-1-chenhuacai@loongson.cn>
TO: Huacai Chen <chenhuacai@loongson.cn>
TO: Thomas Gleixner <tglx@linutronix.de>
TO: Marc Zyngier <maz@kernel.org>
CC: linux-kernel(a)vger.kernel.org
CC: Xuefeng Li <lixuefeng@loongson.cn>
CC: Huacai Chen <chenhuacai@gmail.com>
CC: Jiaxun Yang <jiaxun.yang@flygoat.com>
CC: kernel test robot <lkp@intel.com>

Hi Huacai,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tip/irq/core]
[also build test WARNING on linus/master next-20220808]
[cannot apply to v5.19]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Huacai-Chen/irqchip-=
Select-downstream-irqchip-drivers-for-LoongArch-CPU/20220808-165519
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 779fda8=
6bdeb86bad6daa4f0ecf37788dfc26f6c
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: loongarch-randconfig-r022-20220807 (https://download.01.org/0day-ci=
/archive/20220808/202208082052.rYETKVqt-lkp(a)intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/72710986a76f9fec9c8=
c467de4960ccd8320a33e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Huacai-Chen/irqchip-Select-downstr=
eam-irqchip-drivers-for-LoongArch-CPU/20220808-165519
        git checkout 72710986a76f9fec9c8c467de4960ccd8320a33e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 W=3D1 O=3Dbuild_dir ARCH=3Dloongarch SHELL=3D/bin/bash drivers/irqchip/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/irqchip/irq-loongson-pch-msi.c:88:15: error: variable 'pch_msi_d=
omain_info' has initializer but incomplete type
      88 | static struct msi_domain_info pch_msi_domain_info =3D {
         |               ^~~~~~~~~~~~~~~
   drivers/irqchip/irq-loongson-pch-msi.c:89:10: error: 'struct msi_domain_=
info' has no member named 'flags'
      89 |         .flags  =3D MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_=
CHIP_OPS |
         |          ^~~~~
   drivers/irqchip/irq-loongson-pch-msi.c:89:19: error: 'MSI_FLAG_USE_DEF_D=
OM_OPS' undeclared here (not in a function)
      89 |         .flags  =3D MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_=
CHIP_OPS |
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-loongson-pch-msi.c:89:46: error: 'MSI_FLAG_USE_DEF_C=
HIP_OPS' undeclared here (not in a function)
      89 |         .flags  =3D MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_=
CHIP_OPS |
         |                                              ^~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/irqchip/irq-loongson-pch-msi.c:90:19: error: 'MSI_FLAG_MULTI_PCI=
_MSI' undeclared here (not in a function)
      90 |                   MSI_FLAG_MULTI_PCI_MSI | MSI_FLAG_PCI_MSIX,
         |                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-loongson-pch-msi.c:90:44: error: 'MSI_FLAG_PCI_MSIX'=
 undeclared here (not in a function)
      90 |                   MSI_FLAG_MULTI_PCI_MSI | MSI_FLAG_PCI_MSIX,
         |                                            ^~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-loongson-pch-msi.c:89:19: warning: excess elements i=
n struct initializer
      89 |         .flags  =3D MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_=
CHIP_OPS |
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-loongson-pch-msi.c:89:19: note: (near initialization=
 for 'pch_msi_domain_info')
   drivers/irqchip/irq-loongson-pch-msi.c:91:10: error: 'struct msi_domain_=
info' has no member named 'chip'
      91 |         .chip   =3D &pch_msi_irq_chip,
         |          ^~~~
   drivers/irqchip/irq-loongson-pch-msi.c:91:19: warning: excess elements i=
n struct initializer
      91 |         .chip   =3D &pch_msi_irq_chip,
         |                   ^
   drivers/irqchip/irq-loongson-pch-msi.c:91:19: note: (near initialization=
 for 'pch_msi_domain_info')
   drivers/irqchip/irq-loongson-pch-msi.c: In function 'pch_msi_init_domain=
s':
   drivers/irqchip/irq-loongson-pch-msi.c:178:22: error: implicit declarati=
on of function 'pci_msi_create_irq_domain'; did you mean 'pci_msi_get_devic=
e_domain'? [-Werror=3Dimplicit-function-declaration]
     178 |         msi_domain =3D pci_msi_create_irq_domain(domain_handle,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                      pci_msi_get_device_domain
>> drivers/irqchip/irq-loongson-pch-msi.c:178:20: warning: assignment to 's=
truct irq_domain *' from 'int' makes pointer from integer without a cast [-=
Wint-conversion]
     178 |         msi_domain =3D pci_msi_create_irq_domain(domain_handle,
         |                    ^
   drivers/irqchip/irq-loongson-pch-msi.c: At top level:
   drivers/irqchip/irq-loongson-pch-msi.c:88:31: error: storage size of 'pc=
h_msi_domain_info' isn't known
      88 | static struct msi_domain_info pch_msi_domain_info =3D {
         |                               ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for LOONGSON_PCH_MSI
   Depends on [n]: MACH_LOONGSON64 [=3Dy] && PCI [=3Dn]
   Selected by [y]:
   - IRQ_LOONGARCH_CPU [=3Dy]


vim +89 drivers/irqchip/irq-loongson-pch-msi.c

632dcc2c75ef6d Jiaxun Yang 2020-05-28   87  =

632dcc2c75ef6d Jiaxun Yang 2020-05-28   88  static struct msi_domain_info p=
ch_msi_domain_info =3D {
632dcc2c75ef6d Jiaxun Yang 2020-05-28  @89  	.flags	=3D MSI_FLAG_USE_DEF_DO=
M_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
632dcc2c75ef6d Jiaxun Yang 2020-05-28   90  		  MSI_FLAG_MULTI_PCI_MSI | MS=
I_FLAG_PCI_MSIX,
632dcc2c75ef6d Jiaxun Yang 2020-05-28   91  	.chip	=3D &pch_msi_irq_chip,
632dcc2c75ef6d Jiaxun Yang 2020-05-28   92  };
632dcc2c75ef6d Jiaxun Yang 2020-05-28   93  =

632dcc2c75ef6d Jiaxun Yang 2020-05-28   94  static struct irq_chip middle_i=
rq_chip =3D {
632dcc2c75ef6d Jiaxun Yang 2020-05-28   95  	.name			=3D "PCH MSI",
632dcc2c75ef6d Jiaxun Yang 2020-05-28   96  	.irq_mask		=3D irq_chip_mask_p=
arent,
632dcc2c75ef6d Jiaxun Yang 2020-05-28   97  	.irq_unmask		=3D irq_chip_unma=
sk_parent,
632dcc2c75ef6d Jiaxun Yang 2020-05-28   98  	.irq_ack		=3D irq_chip_ack_par=
ent,
632dcc2c75ef6d Jiaxun Yang 2020-05-28   99  	.irq_set_affinity	=3D irq_chip=
_set_affinity_parent,
632dcc2c75ef6d Jiaxun Yang 2020-05-28  100  	.irq_compose_msi_msg	=3D pch_m=
si_compose_msi_msg,
632dcc2c75ef6d Jiaxun Yang 2020-05-28  101  };
632dcc2c75ef6d Jiaxun Yang 2020-05-28  102  =

632dcc2c75ef6d Jiaxun Yang 2020-05-28  103  static int pch_msi_parent_domai=
n_alloc(struct irq_domain *domain,
632dcc2c75ef6d Jiaxun Yang 2020-05-28  104  					unsigned int virq, int hwi=
rq)
632dcc2c75ef6d Jiaxun Yang 2020-05-28  105  {
632dcc2c75ef6d Jiaxun Yang 2020-05-28  106  	struct irq_fwspec fwspec;
632dcc2c75ef6d Jiaxun Yang 2020-05-28  107  =

632dcc2c75ef6d Jiaxun Yang 2020-05-28  108  	fwspec.fwnode =3D domain->pare=
nt->fwnode;
632dcc2c75ef6d Jiaxun Yang 2020-05-28  109  	fwspec.param_count =3D 1;
632dcc2c75ef6d Jiaxun Yang 2020-05-28  110  	fwspec.param[0] =3D hwirq;
632dcc2c75ef6d Jiaxun Yang 2020-05-28  111  =

b10cbca8f03dd1 Tiezhu Yang 2020-07-07  112  	return irq_domain_alloc_irqs_p=
arent(domain, virq, 1, &fwspec);
632dcc2c75ef6d Jiaxun Yang 2020-05-28  113  }
632dcc2c75ef6d Jiaxun Yang 2020-05-28  114  =

632dcc2c75ef6d Jiaxun Yang 2020-05-28  115  static int pch_msi_middle_domai=
n_alloc(struct irq_domain *domain,
632dcc2c75ef6d Jiaxun Yang 2020-05-28  116  					   unsigned int virq,
632dcc2c75ef6d Jiaxun Yang 2020-05-28  117  					   unsigned int nr_irqs, v=
oid *args)
632dcc2c75ef6d Jiaxun Yang 2020-05-28  118  {
632dcc2c75ef6d Jiaxun Yang 2020-05-28  119  	struct pch_msi_data *priv =3D =
domain->host_data;
632dcc2c75ef6d Jiaxun Yang 2020-05-28  120  	int hwirq, err, i;
632dcc2c75ef6d Jiaxun Yang 2020-05-28  121  =

632dcc2c75ef6d Jiaxun Yang 2020-05-28  122  	hwirq =3D pch_msi_allocate_hwi=
rq(priv, nr_irqs);
632dcc2c75ef6d Jiaxun Yang 2020-05-28  123  	if (hwirq < 0)
632dcc2c75ef6d Jiaxun Yang 2020-05-28  124  		return hwirq;
632dcc2c75ef6d Jiaxun Yang 2020-05-28  125  =

632dcc2c75ef6d Jiaxun Yang 2020-05-28  126  	for (i =3D 0; i < nr_irqs; i++=
) {
632dcc2c75ef6d Jiaxun Yang 2020-05-28  127  		err =3D pch_msi_parent_domain=
_alloc(domain, virq + i, hwirq + i);
632dcc2c75ef6d Jiaxun Yang 2020-05-28  128  		if (err)
632dcc2c75ef6d Jiaxun Yang 2020-05-28  129  			goto err_hwirq;
632dcc2c75ef6d Jiaxun Yang 2020-05-28  130  =

632dcc2c75ef6d Jiaxun Yang 2020-05-28  131  		irq_domain_set_hwirq_and_chip=
(domain, virq + i, hwirq + i,
632dcc2c75ef6d Jiaxun Yang 2020-05-28  132  					      &middle_irq_chip, pr=
iv);
632dcc2c75ef6d Jiaxun Yang 2020-05-28  133  	}
632dcc2c75ef6d Jiaxun Yang 2020-05-28  134  =

632dcc2c75ef6d Jiaxun Yang 2020-05-28  135  	return 0;
632dcc2c75ef6d Jiaxun Yang 2020-05-28  136  =

632dcc2c75ef6d Jiaxun Yang 2020-05-28  137  err_hwirq:
632dcc2c75ef6d Jiaxun Yang 2020-05-28  138  	pch_msi_free_hwirq(priv, hwirq=
, nr_irqs);
632dcc2c75ef6d Jiaxun Yang 2020-05-28  139  	irq_domain_free_irqs_parent(do=
main, virq, i - 1);
632dcc2c75ef6d Jiaxun Yang 2020-05-28  140  =

632dcc2c75ef6d Jiaxun Yang 2020-05-28  141  	return err;
632dcc2c75ef6d Jiaxun Yang 2020-05-28  142  }
632dcc2c75ef6d Jiaxun Yang 2020-05-28  143  =

632dcc2c75ef6d Jiaxun Yang 2020-05-28  144  static void pch_msi_middle_doma=
in_free(struct irq_domain *domain,
632dcc2c75ef6d Jiaxun Yang 2020-05-28  145  					   unsigned int virq,
632dcc2c75ef6d Jiaxun Yang 2020-05-28  146  					   unsigned int nr_irqs)
632dcc2c75ef6d Jiaxun Yang 2020-05-28  147  {
632dcc2c75ef6d Jiaxun Yang 2020-05-28  148  	struct irq_data *d =3D irq_dom=
ain_get_irq_data(domain, virq);
632dcc2c75ef6d Jiaxun Yang 2020-05-28  149  	struct pch_msi_data *priv =3D =
irq_data_get_irq_chip_data(d);
632dcc2c75ef6d Jiaxun Yang 2020-05-28  150  =

632dcc2c75ef6d Jiaxun Yang 2020-05-28  151  	irq_domain_free_irqs_parent(do=
main, virq, nr_irqs);
632dcc2c75ef6d Jiaxun Yang 2020-05-28  152  	pch_msi_free_hwirq(priv, d->hw=
irq, nr_irqs);
632dcc2c75ef6d Jiaxun Yang 2020-05-28  153  }
632dcc2c75ef6d Jiaxun Yang 2020-05-28  154  =

632dcc2c75ef6d Jiaxun Yang 2020-05-28  155  static const struct irq_domain_=
ops pch_msi_middle_domain_ops =3D {
632dcc2c75ef6d Jiaxun Yang 2020-05-28  156  	.alloc	=3D pch_msi_middle_doma=
in_alloc,
632dcc2c75ef6d Jiaxun Yang 2020-05-28  157  	.free	=3D pch_msi_middle_domai=
n_free,
632dcc2c75ef6d Jiaxun Yang 2020-05-28  158  };
632dcc2c75ef6d Jiaxun Yang 2020-05-28  159  =

632dcc2c75ef6d Jiaxun Yang 2020-05-28  160  static int pch_msi_init_domains=
(struct pch_msi_data *priv,
023087324000ae Huacai Chen 2022-07-20  161  				struct irq_domain *parent,
023087324000ae Huacai Chen 2022-07-20  162  				struct fwnode_handle *domai=
n_handle)
632dcc2c75ef6d Jiaxun Yang 2020-05-28  163  {
632dcc2c75ef6d Jiaxun Yang 2020-05-28  164  	struct irq_domain *middle_doma=
in, *msi_domain;
632dcc2c75ef6d Jiaxun Yang 2020-05-28  165  =

023087324000ae Huacai Chen 2022-07-20  166  	middle_domain =3D irq_domain_c=
reate_linear(domain_handle,
632dcc2c75ef6d Jiaxun Yang 2020-05-28  167  						priv->num_irqs,
632dcc2c75ef6d Jiaxun Yang 2020-05-28  168  						&pch_msi_middle_domain_op=
s,
632dcc2c75ef6d Jiaxun Yang 2020-05-28  169  						priv);
632dcc2c75ef6d Jiaxun Yang 2020-05-28  170  	if (!middle_domain) {
632dcc2c75ef6d Jiaxun Yang 2020-05-28  171  		pr_err("Failed to create the =
MSI middle domain\n");
632dcc2c75ef6d Jiaxun Yang 2020-05-28  172  		return -ENOMEM;
632dcc2c75ef6d Jiaxun Yang 2020-05-28  173  	}
632dcc2c75ef6d Jiaxun Yang 2020-05-28  174  =

632dcc2c75ef6d Jiaxun Yang 2020-05-28  175  	middle_domain->parent =3D pare=
nt;
632dcc2c75ef6d Jiaxun Yang 2020-05-28  176  	irq_domain_update_bus_token(mi=
ddle_domain, DOMAIN_BUS_NEXUS);
632dcc2c75ef6d Jiaxun Yang 2020-05-28  177  =

023087324000ae Huacai Chen 2022-07-20 @178  	msi_domain =3D pci_msi_create_=
irq_domain(domain_handle,
632dcc2c75ef6d Jiaxun Yang 2020-05-28  179  					       &pch_msi_domain_inf=
o,
632dcc2c75ef6d Jiaxun Yang 2020-05-28  180  					       middle_domain);
632dcc2c75ef6d Jiaxun Yang 2020-05-28  181  	if (!msi_domain) {
632dcc2c75ef6d Jiaxun Yang 2020-05-28  182  		pr_err("Failed to create PCI =
MSI domain\n");
632dcc2c75ef6d Jiaxun Yang 2020-05-28  183  		irq_domain_remove(middle_doma=
in);
632dcc2c75ef6d Jiaxun Yang 2020-05-28  184  		return -ENOMEM;
632dcc2c75ef6d Jiaxun Yang 2020-05-28  185  	}
632dcc2c75ef6d Jiaxun Yang 2020-05-28  186  =

632dcc2c75ef6d Jiaxun Yang 2020-05-28  187  	return 0;
632dcc2c75ef6d Jiaxun Yang 2020-05-28  188  }
632dcc2c75ef6d Jiaxun Yang 2020-05-28  189  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4334573460204535890==--

