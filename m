Content-Type: multipart/mixed; boundary="===============3263261895368815239=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hch-misc:swiotlb-init-cleanup 13/15] arch/x86/kernel/pci-dma.c:79:27: warning: syntax error: 0 |= [syntaxError]
Date: Mon, 04 Apr 2022 18:19:05 +0800
Message-ID: <202204041803.GCdH6wkU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3263261895368815239==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/misc.git swiotlb-init-cleanup
head:   bb1b904265495d29a0d2e237e5eac699af7d4e7f
commit: 7c35e9690b5d0a90a03bbf21a45ad0ae19c07cfa [13/15] swiotlb: merge swi=
otlb-xen initialization into swiotlb
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/x86/kernel/pci-dma.c:79:27: warning: syntax error: 0 |=3D [syntaxEr=
ror]
    x86_swiotlb_enable =3D true;
                             ^

vim +79 arch/x86/kernel/pci-dma.c

cc9bec08f990a7 Christoph Hellwig 2022-02-14  73  =

cc9bec08f990a7 Christoph Hellwig 2022-02-14  74  #ifdef CONFIG_SWIOTLB_XEN
cc9bec08f990a7 Christoph Hellwig 2022-02-14  75  static void __init pci_xen=
_swiotlb_init(void)
cc9bec08f990a7 Christoph Hellwig 2022-02-14  76  {
c3dd04d912572e Christoph Hellwig 2022-03-29  77  	if (!xen_initial_domain()=
 && !x86_swiotlb_enable)
cc9bec08f990a7 Christoph Hellwig 2022-02-14  78  		return;
cc9bec08f990a7 Christoph Hellwig 2022-02-14 @79  	x86_swiotlb_enable =3D tr=
ue;
7c35e9690b5d0a Christoph Hellwig 2022-03-14  80  	x86_swiotlb_flags |=3D SW=
IOTLB_ANY;
7c35e9690b5d0a Christoph Hellwig 2022-03-14  81  	swiotlb_init_remap(true, =
x86_swiotlb_flags, xen_swiotlb_fixup);
cc9bec08f990a7 Christoph Hellwig 2022-02-14  82  	dma_ops =3D &xen_swiotlb_=
dma_ops;
cc9bec08f990a7 Christoph Hellwig 2022-02-14  83  	if (IS_ENABLED(CONFIG_PCI=
))
cc9bec08f990a7 Christoph Hellwig 2022-02-14  84  		pci_request_acs();
cc9bec08f990a7 Christoph Hellwig 2022-02-14  85  }
cc9bec08f990a7 Christoph Hellwig 2022-02-14  86  =


:::::: The code at line 79 was first introduced by commit
:::::: cc9bec08f990a7014c7c824608ac4efe7f5dd712 x86: remove the IOMMU table=
 infrastructure

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Christoph Hellwig <hch@lst.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3263261895368815239==--

