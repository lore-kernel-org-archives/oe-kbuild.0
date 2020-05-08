Content-Type: multipart/mixed; boundary="===============4121301281040557699=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-4.4 86/91] drivers/staging/gasket/gasket_core.c:1013:15: sparse: expected void *cpu_addr
Date: Fri, 08 May 2020 18:14:36 +0800
Message-ID: <202005081833.3aHLSFBM%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4121301281040557699==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-4.4
head:   1231e06d9791a1cb79112533c0405c40300fbd95
commit: f7b1f7e308f5663ca90b5f1d0c039cf7a3b97110 [86/91] CHROMIUM: staging:=
 gasket: fix mmap of coherent buffer when IOMMU translation on
reproduce:
        # apt-get install sparse
        # sparse version: =

        git checkout f7b1f7e308f5663ca90b5f1d0c039cf7a3b97110
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/staging/gasket/gasket_core.c:1013:15: sparse: warning: incorrect=
 type in argument 3 (different address spaces)
>> drivers/staging/gasket/gasket_core.c:1013:15: sparse:    expected void *=
cpu_addr
>> drivers/staging/gasket/gasket_core.c:1013:15: sparse:    got unsigned ch=
ar [noderef] [usertype] <asn:2> *virt_base

git remote add chrome-os https://chromium.googlesource.com/chromiumos/third=
_party/kernel
git remote update chrome-os
git checkout f7b1f7e308f5663ca90b5f1d0c039cf7a3b97110
vim +1013 drivers/staging/gasket/gasket_core.c

f3463fa3ff0459 Simon Que   2018-06-29   987  =

2a498bf1f01090 Todd Poynor 2018-07-29   988  /* Map a region of coherent me=
mory. */
fea755803823c5 Todd Poynor 2018-07-31   989  static int gasket_mmap_coheren=
t(struct gasket_dev *gasket_dev,
fea755803823c5 Todd Poynor 2018-07-31   990  				struct vm_area_struct *vma)
f3463fa3ff0459 Simon Que   2018-06-29   991  {
f3463fa3ff0459 Simon Que   2018-06-29   992  	const struct gasket_driver_de=
sc *driver_desc =3D
f3463fa3ff0459 Simon Que   2018-06-29   993  		gasket_dev->internal_desc->d=
river_desc;
f3463fa3ff0459 Simon Que   2018-06-29   994  	const ulong requested_length =
=3D vma->vm_end - vma->vm_start;
f3463fa3ff0459 Simon Que   2018-06-29   995  	int ret;
f3463fa3ff0459 Simon Que   2018-06-29   996  	ulong permissions;
f3463fa3ff0459 Simon Que   2018-06-29   997  =

f3463fa3ff0459 Simon Que   2018-06-29   998  	if (requested_length =3D=3D 0=
 || requested_length >
f3463fa3ff0459 Simon Que   2018-06-29   999  	    gasket_dev->coherent_buff=
er.length_bytes) {
f3463fa3ff0459 Simon Que   2018-06-29  1000  		trace_gasket_mmap_exit(-EINV=
AL);
f3463fa3ff0459 Simon Que   2018-06-29  1001  		return -EINVAL;
f3463fa3ff0459 Simon Que   2018-06-29  1002  	}
f3463fa3ff0459 Simon Que   2018-06-29  1003  =

f3463fa3ff0459 Simon Que   2018-06-29  1004  	permissions =3D driver_desc->=
coherent_buffer_description.permissions;
f3463fa3ff0459 Simon Que   2018-06-29  1005  	if (!gasket_mmap_has_permissi=
ons(gasket_dev, vma, permissions)) {
0407a129da6e98 Todd Poynor 2018-07-26  1006  		dev_err(gasket_dev->dev, "Pe=
rmission checking failed.\n");
f3463fa3ff0459 Simon Que   2018-06-29  1007  		trace_gasket_mmap_exit(-EPER=
M);
f3463fa3ff0459 Simon Que   2018-06-29  1008  		return -EPERM;
f3463fa3ff0459 Simon Que   2018-06-29  1009  	}
f3463fa3ff0459 Simon Que   2018-06-29  1010  =

f3463fa3ff0459 Simon Que   2018-06-29  1011  	vma->vm_page_prot =3D pgprot_=
noncached(vma->vm_page_prot);
f7b1f7e308f566 Todd Poynor 2019-08-27  1012  	vma->vm_pgoff =3D 0;
f7b1f7e308f566 Todd Poynor 2019-08-27 @1013  	ret =3D dma_mmap_coherent(gas=
ket_dev->dma_dev, vma,
f7b1f7e308f566 Todd Poynor 2019-08-27  1014  				gasket_dev->coherent_buffe=
r.virt_base,
f7b1f7e308f566 Todd Poynor 2019-08-27  1015  				gasket_dev->coherent_buffe=
r.phys_base,
f7b1f7e308f566 Todd Poynor 2019-08-27  1016  				requested_length);
f3463fa3ff0459 Simon Que   2018-06-29  1017  	if (ret) {
f7b1f7e308f566 Todd Poynor 2019-08-27  1018  		dev_err(gasket_dev->dev,
f7b1f7e308f566 Todd Poynor 2019-08-27  1019  			"Error mmapping coherent bu=
ffer err=3D%d.\n", ret);
f3463fa3ff0459 Simon Que   2018-06-29  1020  		trace_gasket_mmap_exit(ret);
f3463fa3ff0459 Simon Que   2018-06-29  1021  		return ret;
f3463fa3ff0459 Simon Que   2018-06-29  1022  	}
f3463fa3ff0459 Simon Que   2018-06-29  1023  =

f3463fa3ff0459 Simon Que   2018-06-29  1024  	/* Record the user virtual to=
 dma_address mapping that was
f3463fa3ff0459 Simon Que   2018-06-29  1025  	 * created by the kernel.
f3463fa3ff0459 Simon Que   2018-06-29  1026  	 */
fea755803823c5 Todd Poynor 2018-07-31  1027  	gasket_set_user_virt(gasket_d=
ev, requested_length,
fea755803823c5 Todd Poynor 2018-07-31  1028  			     gasket_dev->coherent_b=
uffer.phys_base,
fea755803823c5 Todd Poynor 2018-07-31  1029  			     vma->vm_start);
f3463fa3ff0459 Simon Que   2018-06-29  1030  	return 0;
f3463fa3ff0459 Simon Que   2018-06-29  1031  }
f3463fa3ff0459 Simon Que   2018-06-29  1032  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4121301281040557699==--

