Content-Type: multipart/mixed; boundary="===============1432248429778161091=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [arnd-playground:randconfig-5.13 102/585] Warning: Kernel ABI header at 'tools/include/uapi/sound/asound.h' differs from latest version at 'include/uapi/sound/asound.h': 614> #if !(__BITS_PER_LONG == 32 && defined(__USE_TIME_BITS64))
Date: Thu, 03 Jun 2021 05:54:18 +0800
Message-ID: <202106030512.auo4A1ST-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1432248429778161091==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git=
 randconfig-5.13
head:   36fc4b7a9bf27491b6165cd5e546e41e0a7290ae
commit: 79291aa5a517c994f6e1d1ec112a0b9957e73ee0 [102/585] ALSA: Deprecate =
CLOCK_REALTIME timestamps
:::::: branch date: 2 days ago
:::::: commit date: 2 weeks ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
>> Warning: Kernel ABI header at 'tools/include/uapi/sound/asound.h' differ=
s from latest version at 'include/uapi/sound/asound.h':  614> #if !(__BITS_=
PER_LONG =3D=3D 32 && defined(__USE_TIME_BITS64))
>> Warning: Kernel ABI header at 'tools/include/uapi/sound/asound.h' differ=
s from latest version at 'include/uapi/sound/asound.h':  615< 	SNDRV_PCM_TS=
TAMP_TYPE_MONOTONIC,	/* posix_clock_monotonic equivalent */
>> Warning: Kernel ABI header at 'tools/include/uapi/sound/asound.h' differ=
s from latest version at 'include/uapi/sound/asound.h':  616> #endif
   Warning: Kernel ABI header at 'tools/include/uapi/sound/asound.h' differ=
s from latest version at 'include/uapi/sound/asound.h':  617> 	SNDRV_PCM_TS=
TAMP_TYPE_MONOTONIC =3D 1,	/* posix_clock_monotonic equivalent */

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1432248429778161091==--

