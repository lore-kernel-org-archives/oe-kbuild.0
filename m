Content-Type: multipart/mixed; boundary="===============6162399266239453134=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iio/dac/ad3552r.c:778:44: warning: Parameter 'vals' can be declared with const [constParameter]
Date: Mon, 11 Apr 2022 05:31:14 +0800
Message-ID: <202204110502.7mOrl6hz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6162399266239453134==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mihail Chindris <mihail.chindris@analog.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4ea3c6425269d33da53c79d539ce9554117cf4d4
commit: 8f2b54824b28ba8317c60947b5941d686e3df70d drivers:iio:dac: Add AD355=
2R driver support
date:   4 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 months ago
compiler: ia64-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 8f2b54824b28ba8317c60947b5941d686e3df70d
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/iio/dac/ad3552r.c:778:44: warning: Parameter 'vals' can be decla=
red with const [constParameter]
   static int ad3552r_find_range(u16 id, s32 *vals)
                                              ^

vim +/vals +778 drivers/iio/dac/ad3552r.c

8f2b54824b28ba Mihail Chindris 2021-12-13  777  =

8f2b54824b28ba Mihail Chindris 2021-12-13 @778  static int ad3552r_find_ran=
ge(u16 id, s32 *vals)
8f2b54824b28ba Mihail Chindris 2021-12-13  779  {
8f2b54824b28ba Mihail Chindris 2021-12-13  780  	int i, len;
8f2b54824b28ba Mihail Chindris 2021-12-13  781  	const s32 (*ranges)[2];
8f2b54824b28ba Mihail Chindris 2021-12-13  782  =

8f2b54824b28ba Mihail Chindris 2021-12-13  783  	if (id =3D=3D AD3542R_ID) {
8f2b54824b28ba Mihail Chindris 2021-12-13  784  		len =3D ARRAY_SIZE(ad3542=
r_ch_ranges);
8f2b54824b28ba Mihail Chindris 2021-12-13  785  		ranges =3D ad3542r_ch_ran=
ges;
8f2b54824b28ba Mihail Chindris 2021-12-13  786  	} else {
8f2b54824b28ba Mihail Chindris 2021-12-13  787  		len =3D ARRAY_SIZE(ad3552=
r_ch_ranges);
8f2b54824b28ba Mihail Chindris 2021-12-13  788  		ranges =3D ad3552r_ch_ran=
ges;
8f2b54824b28ba Mihail Chindris 2021-12-13  789  	}
8f2b54824b28ba Mihail Chindris 2021-12-13  790  =

8f2b54824b28ba Mihail Chindris 2021-12-13  791  	for (i =3D 0; i < len; i++)
8f2b54824b28ba Mihail Chindris 2021-12-13  792  		if (vals[0] =3D=3D ranges=
[i][0] * 1000 &&
8f2b54824b28ba Mihail Chindris 2021-12-13  793  		    vals[1] =3D=3D ranges=
[i][1] * 1000)
8f2b54824b28ba Mihail Chindris 2021-12-13  794  			return i;
8f2b54824b28ba Mihail Chindris 2021-12-13  795  =

8f2b54824b28ba Mihail Chindris 2021-12-13  796  	return -EINVAL;
8f2b54824b28ba Mihail Chindris 2021-12-13  797  }
8f2b54824b28ba Mihail Chindris 2021-12-13  798  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6162399266239453134==--

