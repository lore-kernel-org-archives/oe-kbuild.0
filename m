Content-Type: multipart/mixed; boundary="===============5554372805104806726=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [lpieralisi-pci:pci/rcar 8/11] drivers/pci/endpoint/pci-epc-mem.c:65 pci_epc_multi_mem_init() warn: double check that we're allocating correct size: 4 vs 112
Date: Thu, 14 May 2020 14:43:59 +0800
Message-ID: <202005141452.xWaKepu1%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5554372805104806726==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Bjorn Helgaas <helgaas@kernel.org>
TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/pci.git =
pci/rcar
head:   3aecbd9786b5e91d7d4819434b20db7dcf71761b
commit: ecbae8715e31504a6ca2f596ed5322a78bb971cb [8/11] PCI: endpoint: Add =
support to handle multiple base for mapping outbound memory
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/pci/endpoint/pci-epc-mem.c:65 pci_epc_multi_mem_init() warn: double=
 check that we're allocating correct size: 4 vs 112

# https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/pci.git/commit=
/?id=3Decbae8715e31504a6ca2f596ed5322a78bb971cb
git remote add lpieralisi-pci https://git.kernel.org/pub/scm/linux/kernel/g=
it/lpieralisi/pci.git
git remote update lpieralisi-pci
git checkout ecbae8715e31504a6ca2f596ed5322a78bb971cb
vim +65 drivers/pci/endpoint/pci-epc-mem.c

52c9285d47459cf Kishon Vijay Abraham I 2017-08-18   37  =

52c9285d47459cf Kishon Vijay Abraham I 2017-08-18   38  /**
ecbae8715e31504 Lad Prabhakar          2020-05-07   39   * pci_epc_multi_me=
m_init() - initialize the pci_epc_mem structure
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10   40   * @epc: the EPC de=
vice that invoked pci_epc_mem_init
ecbae8715e31504 Lad Prabhakar          2020-05-07   41   * @windows: pointe=
r to windows supported by the device
ecbae8715e31504 Lad Prabhakar          2020-05-07   42   * @num_windows: nu=
mber of windows device supports
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10   43   *
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10   44   * Invoke to initia=
lize the pci_epc_mem structure used by the
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10   45   * endpoint functio=
ns to allocate mapped PCI address.
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10   46   */
ecbae8715e31504 Lad Prabhakar          2020-05-07   47  int pci_epc_multi_m=
em_init(struct pci_epc *epc,
ecbae8715e31504 Lad Prabhakar          2020-05-07   48  			   struct pci_ep=
c_mem_window *windows,
ecbae8715e31504 Lad Prabhakar          2020-05-07   49  			   unsigned int =
num_windows)
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10   50  {
ecbae8715e31504 Lad Prabhakar          2020-05-07   51  	struct pci_epc_mem=
 *mem =3D NULL;
ecbae8715e31504 Lad Prabhakar          2020-05-07   52  	unsigned long *bit=
map =3D NULL;
52c9285d47459cf Kishon Vijay Abraham I 2017-08-18   53  	unsigned int page_=
shift;
ecbae8715e31504 Lad Prabhakar          2020-05-07   54  	size_t page_size;
52c9285d47459cf Kishon Vijay Abraham I 2017-08-18   55  	int bitmap_size;
ecbae8715e31504 Lad Prabhakar          2020-05-07   56  	int pages;
ecbae8715e31504 Lad Prabhakar          2020-05-07   57  	int ret;
ecbae8715e31504 Lad Prabhakar          2020-05-07   58  	int i;
ecbae8715e31504 Lad Prabhakar          2020-05-07   59  =

ecbae8715e31504 Lad Prabhakar          2020-05-07   60  	epc->num_windows =
=3D 0;
ecbae8715e31504 Lad Prabhakar          2020-05-07   61  =

ecbae8715e31504 Lad Prabhakar          2020-05-07   62  	if (!windows || !n=
um_windows)
ecbae8715e31504 Lad Prabhakar          2020-05-07   63  		return -EINVAL;
52c9285d47459cf Kishon Vijay Abraham I 2017-08-18   64  =

ecbae8715e31504 Lad Prabhakar          2020-05-07  @65  	epc->windows =3D k=
calloc(num_windows, sizeof(*mem), GFP_KERNEL);
ecbae8715e31504 Lad Prabhakar          2020-05-07   66  	if (!epc->windows)
ecbae8715e31504 Lad Prabhakar          2020-05-07   67  		return -ENOMEM;
ecbae8715e31504 Lad Prabhakar          2020-05-07   68  =

ecbae8715e31504 Lad Prabhakar          2020-05-07   69  	for (i =3D 0; i < =
num_windows; i++) {
ecbae8715e31504 Lad Prabhakar          2020-05-07   70  		page_size =3D win=
dows[i].page_size;
52c9285d47459cf Kishon Vijay Abraham I 2017-08-18   71  		if (page_size < P=
AGE_SIZE)
52c9285d47459cf Kishon Vijay Abraham I 2017-08-18   72  			page_size =3D PA=
GE_SIZE;
52c9285d47459cf Kishon Vijay Abraham I 2017-08-18   73  		page_shift =3D il=
og2(page_size);
ecbae8715e31504 Lad Prabhakar          2020-05-07   74  		pages =3D windows=
[i].size >> page_shift;
52c9285d47459cf Kishon Vijay Abraham I 2017-08-18   75  		bitmap_size =3D B=
ITS_TO_LONGS(pages) * sizeof(long);
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10   76  =

5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10   77  		mem =3D kzalloc(s=
izeof(*mem), GFP_KERNEL);
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10   78  		if (!mem) {
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10   79  			ret =3D -ENOMEM;
ecbae8715e31504 Lad Prabhakar          2020-05-07   80  			i--;
ecbae8715e31504 Lad Prabhakar          2020-05-07   81  			goto err_mem;
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10   82  		}
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10   83  =

5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10   84  		bitmap =3D kzallo=
c(bitmap_size, GFP_KERNEL);
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10   85  		if (!bitmap) {
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10   86  			ret =3D -ENOMEM;
ecbae8715e31504 Lad Prabhakar          2020-05-07   87  			kfree(mem);
ecbae8715e31504 Lad Prabhakar          2020-05-07   88  			i--;
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10   89  			goto err_mem;
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10   90  		}
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10   91  =

ecbae8715e31504 Lad Prabhakar          2020-05-07   92  		mem->window.phys_=
base =3D windows[i].phys_base;
ecbae8715e31504 Lad Prabhakar          2020-05-07   93  		mem->window.size =
=3D windows[i].size;
ecbae8715e31504 Lad Prabhakar          2020-05-07   94  		mem->window.page_=
size =3D page_size;
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10   95  		mem->bitmap =3D b=
itmap;
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10   96  		mem->pages =3D pa=
ges;
04e046ca57ebed3 Kishon Vijay Abraham I 2020-02-24   97  		mutex_init(&mem->=
lock);
ecbae8715e31504 Lad Prabhakar          2020-05-07   98  		epc->windows[i] =
=3D mem;
ecbae8715e31504 Lad Prabhakar          2020-05-07   99  	}
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10  100  =

ecbae8715e31504 Lad Prabhakar          2020-05-07  101  	epc->mem =3D epc->=
windows[0];
ecbae8715e31504 Lad Prabhakar          2020-05-07  102  	epc->num_windows =
=3D num_windows;
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10  103  =

5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10  104  	return 0;
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10  105  =

5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10  106  err_mem:
ecbae8715e31504 Lad Prabhakar          2020-05-07  107  	for (; i >=3D 0; i=
--) {
ecbae8715e31504 Lad Prabhakar          2020-05-07  108  		mem =3D epc->wind=
ows[i];
ecbae8715e31504 Lad Prabhakar          2020-05-07  109  		kfree(mem->bitmap=
);
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10  110  		kfree(mem);
ecbae8715e31504 Lad Prabhakar          2020-05-07  111  	}
ecbae8715e31504 Lad Prabhakar          2020-05-07  112  	kfree(epc->windows=
);
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10  113  =

5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10  114  	return ret;
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10  115  }
ecbae8715e31504 Lad Prabhakar          2020-05-07  116  EXPORT_SYMBOL_GPL(p=
ci_epc_multi_mem_init);
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10  117  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5554372805104806726==--

