Content-Type: multipart/mixed; boundary="===============6495716334619322458=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [avpatel:riscv_kvm_aia_v1 28/40] drivers/irqchip/irq-riscv-imsic.c:152:14: sparse: void [noderef] __iomem *extern [addressable] [toplevel] imsic_cpu_page_virt( ... )
Date: Thu, 09 Dec 2021 17:35:31 +0800
Message-ID: <202112091726.5JKS8Ekz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6495716334619322458==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Anup Patel <anup.patel@wdc.com>

tree:   https://github.com/avpatel/linux.git riscv_kvm_aia_v1
head:   eb55ca3817a59020fc1e3d5a5de0a5adcebbedd0
commit: 2ad4dc808c3e0175e4975b41cecbb996ee217731 [28/40] irqchip: Add incom=
ing MSI controller driver
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: riscv-randconfig-s032-20211209 (https://download.01.org/0day-ci/arc=
hive/20211209/202112091726.5JKS8Ekz-lkp(a)intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/avpatel/linux/commit/2ad4dc808c3e0175e4975b41c=
ecbb996ee217731
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel riscv_kvm_aia_v1
        git checkout 2ad4dc808c3e0175e4975b41cecbb996ee217731
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dr=
iscv SHELL=3D/bin/bash drivers/irqchip/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   drivers/irqchip/irq-riscv-imsic.c:152:14: sparse: sparse: symbol 'imsic_=
cpu_page_virt' redeclared with different type (different address spaces):
>> drivers/irqchip/irq-riscv-imsic.c:152:14: sparse:    void [noderef] __io=
mem *extern [addressable] [toplevel] imsic_cpu_page_virt( ... )
   drivers/irqchip/irq-riscv-imsic.c: note: in included file:
   include/linux/irqchip/riscv-imsic.h:46:13: sparse: note: previously decl=
ared as:
>> include/linux/irqchip/riscv-imsic.h:46:13: sparse:    void *extern [addr=
essable] [toplevel] imsic_cpu_page_virt( ... )

vim +152 drivers/irqchip/irq-riscv-imsic.c

2ad4dc808c3e01 Anup Patel 2021-04-26  151  =

2ad4dc808c3e01 Anup Patel 2021-04-26 @152  void __iomem *imsic_cpu_page_vir=
t(unsigned int cpu, unsigned int guest_index)
2ad4dc808c3e01 Anup Patel 2021-04-26  153  {
2ad4dc808c3e01 Anup Patel 2021-04-26  154  	struct imsic_handler *handler;
2ad4dc808c3e01 Anup Patel 2021-04-26  155  =

2ad4dc808c3e01 Anup Patel 2021-04-26  156  	handler =3D per_cpu_ptr(&imsic_=
handlers, cpu);
2ad4dc808c3e01 Anup Patel 2021-04-26  157  	if (!handler || !handler->priv)
2ad4dc808c3e01 Anup Patel 2021-04-26  158  		return NULL;
2ad4dc808c3e01 Anup Patel 2021-04-26  159  	if (BIT(handler->priv->guest_in=
dex_bits) <=3D guest_index)
2ad4dc808c3e01 Anup Patel 2021-04-26  160  		return NULL;
2ad4dc808c3e01 Anup Patel 2021-04-26  161  =

2ad4dc808c3e01 Anup Patel 2021-04-26  162  	return handler->msi_va + (guest=
_index * IMSIC_MMIO_PAGE_SZ);
2ad4dc808c3e01 Anup Patel 2021-04-26  163  }
2ad4dc808c3e01 Anup Patel 2021-04-26  164  EXPORT_SYMBOL_GPL(imsic_cpu_page=
_virt);
2ad4dc808c3e01 Anup Patel 2021-04-26  165  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6495716334619322458==--

