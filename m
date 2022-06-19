Content-Type: multipart/mixed; boundary="===============1882332284742044009=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 3459/4317] drivers/gpu/drm/vc4/vc4_perfmon.c:25 vc4_perfmon_get() warn: variable dereferenced before check 'perfmon' (see line 20)
Date: Sun, 19 Jun 2022 12:12:41 +0800
Message-ID: <202206191217.pbL9f0PA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1882332284742044009==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Maxime Ripard <maxime@cerno.tech>
CC: Melissa Wen <mwen@igalia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   07dc787be2316e243a16a33d0a9b734cd9365bd3
commit: 30f8c74ca9b7b3a2db55f6bb1d2e9f8c47a79f94 [3459/4317] drm/vc4: Warn =
if some v3d code is run on BCM2711
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: parisc-randconfig-m031-20220619 (https://download.01.org/0day-ci/ar=
chive/20220619/202206191217.pbL9f0PA-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/vc4/vc4_perfmon.c:25 vc4_perfmon_get() warn: variable deref=
erenced before check 'perfmon' (see line 20)
drivers/gpu/drm/vc4/vc4_perfmon.c:240 vc4_perfmon_get_values_ioctl() warn: =
variable dereferenced before check 'perfmon' (see line 237)
drivers/gpu/drm/vc4/vc4_validate.c:173 vc4_check_tex_size() warn: signednes=
s bug returning '(-19)'

vim +/perfmon +25 drivers/gpu/drm/vc4/vc4_perfmon.c

65101d8c910820 Boris Brezillon 2018-01-12  17  =

65101d8c910820 Boris Brezillon 2018-01-12  18  void vc4_perfmon_get(struct =
vc4_perfmon *perfmon)
65101d8c910820 Boris Brezillon 2018-01-12  19  {
30f8c74ca9b7b3 Maxime Ripard   2022-06-10 @20  	struct vc4_dev *vc4 =3D per=
fmon->dev;
30f8c74ca9b7b3 Maxime Ripard   2022-06-10  21  =

30f8c74ca9b7b3 Maxime Ripard   2022-06-10  22  	if (WARN_ON_ONCE(vc4->is_vc=
5))
30f8c74ca9b7b3 Maxime Ripard   2022-06-10  23  		return;
30f8c74ca9b7b3 Maxime Ripard   2022-06-10  24  =

65101d8c910820 Boris Brezillon 2018-01-12 @25  	if (perfmon)
65101d8c910820 Boris Brezillon 2018-01-12  26  		refcount_inc(&perfmon->ref=
cnt);
65101d8c910820 Boris Brezillon 2018-01-12  27  }
65101d8c910820 Boris Brezillon 2018-01-12  28  =


:::::: The code at line 25 was first introduced by commit
:::::: 65101d8c9108201118efa7e08f4e2c57f438deb9 drm/vc4: Expose performance=
 counters to userspace

:::::: TO: Boris Brezillon <boris.brezillon@free-electrons.com>
:::::: CC: Eric Anholt <eric@anholt.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1882332284742044009==--

