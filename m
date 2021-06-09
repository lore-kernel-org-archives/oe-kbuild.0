Content-Type: multipart/mixed; boundary="===============8171679248385863649=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/wireless/util.c:1194:6: warning: Same expression on both sides of '-'. [duplicateExpression]
Date: Thu, 10 Jun 2021 04:06:57 +0800
Message-ID: <202106100446.sidr9UYS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8171679248385863649==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Max Chen <mxchen@codeaurora.org>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   368094df48e680fa51cedb68537408cfa64b788e
commit: d9c85e24726587277ce0dcf33b5695acfcc72234 cfg80211: Add phyrate conv=
ersion support for extended MCS in 60GHz band
date:   5 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 5 months ago
compiler: powerpc64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> net/wireless/util.c:1194:6: warning: Same expression on both sides of '-=
'. [duplicateExpression]
     [6 - 6] =3D 26950, /* MCS 9.1 : 2695.0 mbps */
        ^

vim +1194 net/wireless/util.c

95ddc1fc4519ed Vladimir Kondratiev 2012-07-05  1190  =

d9c85e24726587 Max Chen            2021-01-06  1191  static u32 cfg80211_ca=
lculate_bitrate_extended_sc_dmg(struct rate_info *rate)
d9c85e24726587 Max Chen            2021-01-06  1192  {
d9c85e24726587 Max Chen            2021-01-06  1193  	static const u32 __mc=
s2bitrate[] =3D {
d9c85e24726587 Max Chen            2021-01-06 @1194  		[6 - 6] =3D 26950, /=
* MCS 9.1 : 2695.0 mbps */
d9c85e24726587 Max Chen            2021-01-06  1195  		[7 - 6] =3D 50050, /=
* MCS 12.1 */
d9c85e24726587 Max Chen            2021-01-06  1196  		[8 - 6] =3D 53900,
d9c85e24726587 Max Chen            2021-01-06  1197  		[9 - 6] =3D 57750,
d9c85e24726587 Max Chen            2021-01-06  1198  		[10 - 6] =3D 63900,
d9c85e24726587 Max Chen            2021-01-06  1199  		[11 - 6] =3D 75075,
d9c85e24726587 Max Chen            2021-01-06  1200  		[12 - 6] =3D 80850,
d9c85e24726587 Max Chen            2021-01-06  1201  	};
d9c85e24726587 Max Chen            2021-01-06  1202  =

d9c85e24726587 Max Chen            2021-01-06  1203  	/* Extended SC MCS no=
t defined for base MCS below 6 or above 12 */
d9c85e24726587 Max Chen            2021-01-06  1204  	if (WARN_ON_ONCE(rate=
->mcs < 6 || rate->mcs > 12))
d9c85e24726587 Max Chen            2021-01-06  1205  		return 0;
d9c85e24726587 Max Chen            2021-01-06  1206  =

d9c85e24726587 Max Chen            2021-01-06  1207  	return __mcs2bitrate[=
rate->mcs - 6];
d9c85e24726587 Max Chen            2021-01-06  1208  }
d9c85e24726587 Max Chen            2021-01-06  1209  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8171679248385863649==--

