Content-Type: multipart/mixed; boundary="===============0691858325990032381=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ti:ti-rt-linux-5.10.y 582/9999] drivers/pci/endpoint/pci-epf-core.c:169 pci_epf_add_vepf() warn: inconsistent returns '&epf_pf->lock'.
Date: Fri, 18 Feb 2022 09:45:29 +0800
Message-ID: <202202180932.0xM6JHXf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0691858325990032381==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: vigneshr(a)ti.com
CC: nm(a)ti.com
TO: Kishon Vijay Abraham I <kishon@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.=
10.y
head:   b975aee14750c395bf5251ba4042cb0be1afa206
commit: 0cf43e35b1743dc43574089fcf3ff71d8cd2ae39 [582/9999] PCI: endpoint: =
Add support to add virtual function in endpoint core
:::::: branch date: 11 hours ago
:::::: commit date: 11 months ago
config: s390-randconfig-m031-20220217 (https://download.01.org/0day-ci/arch=
ive/20220218/202202180932.0xM6JHXf-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/pci/endpoint/pci-epf-core.c:169 pci_epf_add_vepf() warn: inconsiste=
nt returns '&epf_pf->lock'.

vim +169 drivers/pci/endpoint/pci-epf-core.c

5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10  130  =

0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  131  /**
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  132   * pci_epf_add_vepf=
() - associate virtual EP function to physical EP function
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  133   * @epf_pf: the phy=
sical EP function to which the virtual EP function should be
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  134   *   associated
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  135   * @epf_vf: the vir=
tual EP function to be added
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  136   *
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  137   * A physical endpo=
int function can be associated with multiple virtual
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  138   * endpoint functio=
ns. Invoke pci_epf_add_epf() to add a virtual PCI endpoint
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  139   * function to a ph=
ysical PCI endpoint function.
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  140   */
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  141  int pci_epf_add_vep=
f(struct pci_epf *epf_pf, struct pci_epf *epf_vf)
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  142  {
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  143  	u32 vfunc_no;
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  144  =

0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  145  	if (IS_ERR_OR_NULL=
(epf_pf) || IS_ERR_OR_NULL(epf_vf))
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  146  		return -EINVAL;
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  147  =

0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  148  	if (epf_pf->epc ||=
 epf_vf->epc || epf_vf->epf_pf)
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  149  		return -EBUSY;
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  150  =

0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  151  	if (epf_pf->sec_ep=
c || epf_vf->sec_epc)
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  152  		return -EBUSY;
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  153  =

0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  154  	mutex_lock(&epf_pf=
->lock);
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  155  	vfunc_no =3D find_=
first_zero_bit(&epf_pf->vfunction_num_map,
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  156  				       BITS_PER=
_LONG);
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  157  	if (vfunc_no >=3D =
BITS_PER_LONG)
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  158  		return -EINVAL;
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  159  =

0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  160  	set_bit(vfunc_no, =
&epf_pf->vfunction_num_map);
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  161  	epf_vf->vfunc_no =
=3D vfunc_no;
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  162  =

0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  163  	epf_vf->epf_pf =3D=
 epf_pf;
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  164  	epf_vf->is_vf =3D =
true;
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  165  =

0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  166  	list_add_tail(&epf=
_vf->list, &epf_pf->pci_vepf);
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  167  	mutex_unlock(&epf_=
pf->lock);
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  168  =

0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30 @169  	return 0;
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  170  }
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  171  EXPORT_SYMBOL_GPL(p=
ci_epf_add_vepf);
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  172  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0691858325990032381==--

