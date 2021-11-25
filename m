Content-Type: multipart/mixed; boundary="===============4163056159833675938=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 395/3632] drivers/dma-buf/st-dma-resv.c:58 sanitycheck() warn: inconsistent returns '&resv'.
Date: Fri, 26 Nov 2021 00:47:25 +0800
Message-ID: <202111260017.lF4RQHhf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4163056159833675938==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Christian K=C3=B6nig" <christian.koenig@amd.com>
CC: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
CC: Daniel Vetter <daniel.vetter@ffwll.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   f81e94e91878bded599cc60f2881cfd50991aeb9
commit: 1d51775cd3f51899ce85afab686c7f641ff32d4e [395/3632] dma-buf: add dm=
a_resv selftest v4
:::::: branch date: 12 hours ago
:::::: commit date: 5 weeks ago
config: openrisc-randconfig-m031-20211122 (https://download.01.org/0day-ci/=
archive/20211126/202111260017.lF4RQHhf-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0

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

1d51775cd3f5189 Christian K=C3=B6nig 2021-09-24  37  =

1d51775cd3f5189 Christian K=C3=B6nig 2021-09-24  38  static int sanitycheck=
(void *arg)
1d51775cd3f5189 Christian K=C3=B6nig 2021-09-24  39  {
1d51775cd3f5189 Christian K=C3=B6nig 2021-09-24  40  	struct dma_resv resv;
1d51775cd3f5189 Christian K=C3=B6nig 2021-09-24  41  	struct dma_fence *f;
1d51775cd3f5189 Christian K=C3=B6nig 2021-09-24  42  	int r;
1d51775cd3f5189 Christian K=C3=B6nig 2021-09-24  43  =

1d51775cd3f5189 Christian K=C3=B6nig 2021-09-24  44  	f =3D alloc_fence();
1d51775cd3f5189 Christian K=C3=B6nig 2021-09-24  45  	if (!f)
1d51775cd3f5189 Christian K=C3=B6nig 2021-09-24  46  		return -ENOMEM;
1d51775cd3f5189 Christian K=C3=B6nig 2021-09-24  47  =

1d51775cd3f5189 Christian K=C3=B6nig 2021-09-24  48  	dma_fence_signal(f);
1d51775cd3f5189 Christian K=C3=B6nig 2021-09-24  49  	dma_fence_put(f);
1d51775cd3f5189 Christian K=C3=B6nig 2021-09-24  50  =

1d51775cd3f5189 Christian K=C3=B6nig 2021-09-24  51  	dma_resv_init(&resv);
1d51775cd3f5189 Christian K=C3=B6nig 2021-09-24  52  	r =3D dma_resv_lock(&=
resv, NULL);
1d51775cd3f5189 Christian K=C3=B6nig 2021-09-24  53  	if (r)
1d51775cd3f5189 Christian K=C3=B6nig 2021-09-24  54  		pr_err("Resv locking=
 failed\n");
1d51775cd3f5189 Christian K=C3=B6nig 2021-09-24  55  	else
1d51775cd3f5189 Christian K=C3=B6nig 2021-09-24  56  		dma_resv_unlock(&res=
v);
1d51775cd3f5189 Christian K=C3=B6nig 2021-09-24  57  	dma_resv_fini(&resv);
1d51775cd3f5189 Christian K=C3=B6nig 2021-09-24 @58  	return r;
1d51775cd3f5189 Christian K=C3=B6nig 2021-09-24  59  }
1d51775cd3f5189 Christian K=C3=B6nig 2021-09-24  60  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4163056159833675938==--

