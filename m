Content-Type: multipart/mixed; boundary="===============6668342923989528188=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 462/12552] drivers/dma-buf/st-dma-fence-unwrap.c:75:39-45: ERROR: reference preceded by free on line 70
Date: Sat, 23 Jul 2022 04:58:56 +0800
Message-ID: <202207230438.l22GDlCD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6668342923989528188==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Christian K=C3=B6nig" <christian.koenig@amd.com>
CC: Daniel Vetter <daniel.vetter@ffwll.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   18c107a1f120d095404d141dfad8f594bdc44020
commit: 0c5064fa8d5a02dc2dcc6c674a0ad1bbaf79efda [462/12552] dma-buf: clean=
up dma_fence_unwrap selftest v2
:::::: branch date: 10 hours ago
:::::: commit date: 8 weeks ago
config: openrisc-randconfig-c004-20220721 (https://download.01.org/0day-ci/=
archive/20220723/202207230438.l22GDlCD-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>

cocci warnings: (new ones prefixed by >>)
>> drivers/dma-buf/st-dma-fence-unwrap.c:75:39-45: ERROR: reference precede=
d by free on line 70

vim +75 drivers/dma-buf/st-dma-fence-unwrap.c

64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  45  =

64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  46  static struct dma_fence=
 *mock_array(unsigned int num_fences, ...)
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  47  {
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  48  	struct dma_fence_array=
 *array;
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  49  	struct dma_fence **fen=
ces;
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  50  	va_list valist;
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  51  	int i;
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  52  =

64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  53  	fences =3D kcalloc(num=
_fences, sizeof(*fences), GFP_KERNEL);
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  54  	if (!fences)
0c5064fa8d5a02 Christian K=C3=B6nig 2022-05-04  55  		goto error_put;
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  56  =

64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  57  	va_start(valist, num_f=
ences);
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  58  	for (i =3D 0; i < num_=
fences; ++i)
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  59  		fences[i] =3D va_arg(=
valist, typeof(*fences));
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  60  	va_end(valist);
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  61  =

64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  62  	array =3D dma_fence_ar=
ray_create(num_fences, fences,
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  63  				       dma_fence_co=
ntext_alloc(1),
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  64  				       1, false);
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  65  	if (!array)
0c5064fa8d5a02 Christian K=C3=B6nig 2022-05-04  66  		goto error_free;
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  67  	return &array->base;
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  68  =

0c5064fa8d5a02 Christian K=C3=B6nig 2022-05-04  69  error_free:
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11 @70  	kfree(fences);
0c5064fa8d5a02 Christian K=C3=B6nig 2022-05-04  71  =

0c5064fa8d5a02 Christian K=C3=B6nig 2022-05-04  72  error_put:
0c5064fa8d5a02 Christian K=C3=B6nig 2022-05-04  73  	va_start(valist, num_f=
ences);
0c5064fa8d5a02 Christian K=C3=B6nig 2022-05-04  74  	for (i =3D 0; i < num_=
fences; ++i)
0c5064fa8d5a02 Christian K=C3=B6nig 2022-05-04 @75  		dma_fence_put(va_arg(=
valist, typeof(*fences)));
0c5064fa8d5a02 Christian K=C3=B6nig 2022-05-04  76  	va_end(valist);
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  77  	return NULL;
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  78  }
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  79  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6668342923989528188==--

