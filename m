Content-Type: multipart/mixed; boundary="===============4884895975738937097=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/dma-buf/st-dma-resv.c:58 sanitycheck() warn: inconsistent returns '&resv'.
Date: Sun, 30 Jan 2022 03:43:47 +0800
Message-ID: <202201300326.I1J5XhkE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4884895975738937097==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Christian K=C3=B6nig" <christian.koenig@amd.com>
CC: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
CC: Daniel Vetter <daniel.vetter@ffwll.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   cb323ee75d24e7acc2f188d123ba6df46159cf09
commit: 1d51775cd3f51899ce85afab686c7f641ff32d4e dma-buf: add dma_resv self=
test v4
date:   3 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 3 months ago
config: powerpc64-randconfig-m031-20220125 (https://download.01.org/0day-ci=
/archive/20220130/202201300326.I1J5XhkE-lkp(a)intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/dma-buf/st-dma-resv.c:58 sanitycheck() warn: inconsistent returns '=
&resv'.

Old smatch warnings:
drivers/dma-buf/st-dma-resv.c:336 test_get_fences() error: uninitialized sy=
mbol 'i'.

vim +58 drivers/dma-buf/st-dma-resv.c

1d51775cd3f518 Christian K=C3=B6nig 2021-09-24  37  =

1d51775cd3f518 Christian K=C3=B6nig 2021-09-24  38  static int sanitycheck(=
void *arg)
1d51775cd3f518 Christian K=C3=B6nig 2021-09-24  39  {
1d51775cd3f518 Christian K=C3=B6nig 2021-09-24  40  	struct dma_resv resv;
1d51775cd3f518 Christian K=C3=B6nig 2021-09-24  41  	struct dma_fence *f;
1d51775cd3f518 Christian K=C3=B6nig 2021-09-24  42  	int r;
1d51775cd3f518 Christian K=C3=B6nig 2021-09-24  43  =

1d51775cd3f518 Christian K=C3=B6nig 2021-09-24  44  	f =3D alloc_fence();
1d51775cd3f518 Christian K=C3=B6nig 2021-09-24  45  	if (!f)
1d51775cd3f518 Christian K=C3=B6nig 2021-09-24  46  		return -ENOMEM;
1d51775cd3f518 Christian K=C3=B6nig 2021-09-24  47  =

1d51775cd3f518 Christian K=C3=B6nig 2021-09-24  48  	dma_fence_signal(f);
1d51775cd3f518 Christian K=C3=B6nig 2021-09-24  49  	dma_fence_put(f);
1d51775cd3f518 Christian K=C3=B6nig 2021-09-24  50  =

1d51775cd3f518 Christian K=C3=B6nig 2021-09-24  51  	dma_resv_init(&resv);
1d51775cd3f518 Christian K=C3=B6nig 2021-09-24  52  	r =3D dma_resv_lock(&r=
esv, NULL);
1d51775cd3f518 Christian K=C3=B6nig 2021-09-24  53  	if (r)
1d51775cd3f518 Christian K=C3=B6nig 2021-09-24  54  		pr_err("Resv locking =
failed\n");
1d51775cd3f518 Christian K=C3=B6nig 2021-09-24  55  	else
1d51775cd3f518 Christian K=C3=B6nig 2021-09-24  56  		dma_resv_unlock(&resv=
);
1d51775cd3f518 Christian K=C3=B6nig 2021-09-24  57  	dma_resv_fini(&resv);
1d51775cd3f518 Christian K=C3=B6nig 2021-09-24 @58  	return r;
1d51775cd3f518 Christian K=C3=B6nig 2021-09-24  59  }
1d51775cd3f518 Christian K=C3=B6nig 2021-09-24  60  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4884895975738937097==--

