Content-Type: multipart/mixed; boundary="===============0112166914535820375=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/s390/cio/vfio_ccw_cp.c:69 page_array_alloc() warn: double check that we're allocating correct size: 8 vs 16
Date: Sun, 07 Aug 2022 12:41:02 +0800
Message-ID: <202208071226.m6YIXeZR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0112166914535820375==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Nicolin Chen <nicolinc@nvidia.com>
CC: Alex Williamson <alex.williamson@redhat.com>
CC: Jason Gunthorpe <jgg@nvidia.com>
CC: Eric Farman <farman@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1612c382ffbdf1f673caec76502b1c00e6d35363
commit: 1331460514ff7d378373223109eefae4cd55ec77 vfio/ccw: Change pa_pfn li=
st to pa_iova list
date:   12 days ago
:::::: branch date: 4 hours ago
:::::: commit date: 12 days ago
config: s390-randconfig-m041-20220807 (https://download.01.org/0day-ci/arch=
ive/20220807/202208071226.m6YIXeZR-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/s390/cio/vfio_ccw_cp.c:69 page_array_alloc() warn: double check tha=
t we're allocating correct size: 8 vs 16
drivers/s390/cio/vfio_ccw_cp.c:76 page_array_alloc() warn: potentially one =
past the end of array 'pa->pa_iova[pa->pa_nr]'

vim +69 drivers/s390/cio/vfio_ccw_cp.c

0a19e61e6d4c61 Dong Jia Shi 2017-03-17  40  =

0a19e61e6d4c61 Dong Jia Shi 2017-03-17  41  /*
1331460514ff7d Nicolin Chen 2022-07-22  42   * page_array_alloc() - alloc m=
emory for page array
1331460514ff7d Nicolin Chen 2022-07-22  43   * @pa: page_array on which to =
perform the operation
5c1cfb1c3948fe Dong Jia Shi 2018-05-23  44   * @iova: target guest physical=
 address
5c1cfb1c3948fe Dong Jia Shi 2018-05-23  45   * @len: number of bytes that s=
hould be pinned from @iova
0a19e61e6d4c61 Dong Jia Shi 2017-03-17  46   *
1331460514ff7d Nicolin Chen 2022-07-22  47   * Attempt to allocate memory f=
or page array.
0a19e61e6d4c61 Dong Jia Shi 2017-03-17  48   *
1331460514ff7d Nicolin Chen 2022-07-22  49   * Usage of page_array:
1331460514ff7d Nicolin Chen 2022-07-22  50   * We expect (pa_nr =3D=3D 0) a=
nd (pa_iova =3D=3D NULL), any field in
5c1cfb1c3948fe Dong Jia Shi 2018-05-23  51   * this structure will be fille=
d in by this function.
0a19e61e6d4c61 Dong Jia Shi 2017-03-17  52   *
0a19e61e6d4c61 Dong Jia Shi 2017-03-17  53   * Returns:
1331460514ff7d Nicolin Chen 2022-07-22  54   *         0 if page array is a=
llocated
1331460514ff7d Nicolin Chen 2022-07-22  55   *   -EINVAL if pa->pa_nr is no=
t initially zero, or pa->pa_iova is not NULL
e4f3f18b12324e Eric Farman  2019-05-15  56   *   -ENOMEM if alloc failed
0a19e61e6d4c61 Dong Jia Shi 2017-03-17  57   */
1331460514ff7d Nicolin Chen 2022-07-22  58  static int page_array_alloc(str=
uct page_array *pa, u64 iova, unsigned int len)
0a19e61e6d4c61 Dong Jia Shi 2017-03-17  59  {
e4f3f18b12324e Eric Farman  2019-05-15  60  	int i;
0a19e61e6d4c61 Dong Jia Shi 2017-03-17  61  =

1331460514ff7d Nicolin Chen 2022-07-22  62  	if (pa->pa_nr || pa->pa_iova)
0a19e61e6d4c61 Dong Jia Shi 2017-03-17  63  		return -EINVAL;
0a19e61e6d4c61 Dong Jia Shi 2017-03-17  64  =

0a19e61e6d4c61 Dong Jia Shi 2017-03-17  65  	pa->pa_nr =3D ((iova & ~PAGE_M=
ASK) + len + (PAGE_SIZE - 1)) >> PAGE_SHIFT;
0a19e61e6d4c61 Dong Jia Shi 2017-03-17  66  	if (!pa->pa_nr)
0a19e61e6d4c61 Dong Jia Shi 2017-03-17  67  		return -EINVAL;
0a19e61e6d4c61 Dong Jia Shi 2017-03-17  68  =

1331460514ff7d Nicolin Chen 2022-07-22 @69  	pa->pa_iova =3D kcalloc(pa->pa=
_nr,
1331460514ff7d Nicolin Chen 2022-07-22  70  			      sizeof(*pa->pa_iova) +=
 sizeof(*pa->pa_pfn),
0a19e61e6d4c61 Dong Jia Shi 2017-03-17  71  			      GFP_KERNEL);
1331460514ff7d Nicolin Chen 2022-07-22  72  	if (unlikely(!pa->pa_iova)) {
c1ab69268d124e Farhan Ali   2019-07-11  73  		pa->pa_nr =3D 0;
0a19e61e6d4c61 Dong Jia Shi 2017-03-17  74  		return -ENOMEM;
c1ab69268d124e Farhan Ali   2019-07-11  75  	}
1331460514ff7d Nicolin Chen 2022-07-22 @76  	pa->pa_pfn =3D (unsigned long =
*)&pa->pa_iova[pa->pa_nr];
0a19e61e6d4c61 Dong Jia Shi 2017-03-17  77  =

1331460514ff7d Nicolin Chen 2022-07-22  78  	pa->pa_iova[0] =3D iova;
c34a12e6a3df3a Eric Farman  2019-05-15  79  	pa->pa_pfn[0] =3D -1ULL;
c34a12e6a3df3a Eric Farman  2019-05-15  80  	for (i =3D 1; i < pa->pa_nr; i=
++) {
1331460514ff7d Nicolin Chen 2022-07-22  81  		pa->pa_iova[i] =3D pa->pa_iov=
a[i - 1] + PAGE_SIZE;
c34a12e6a3df3a Eric Farman  2019-05-15  82  		pa->pa_pfn[i] =3D -1ULL;
c34a12e6a3df3a Eric Farman  2019-05-15  83  	}
5c1cfb1c3948fe Dong Jia Shi 2018-05-23  84  =

e4f3f18b12324e Eric Farman  2019-05-15  85  	return 0;
e4f3f18b12324e Eric Farman  2019-05-15  86  }
e4f3f18b12324e Eric Farman  2019-05-15  87  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0112166914535820375==--

