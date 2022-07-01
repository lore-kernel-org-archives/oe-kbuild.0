Content-Type: multipart/mixed; boundary="===============2446346465934058424=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [sashal-stable:pending-5.15 67/160] net/netfilter/nft_payload.c: linux/ip.h is included more than once.
Date: Fri, 01 Jul 2022 20:31:17 +0800
Message-ID: <202207012023.92bwbxtI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2446346465934058424==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable=
.git pending-5.15
head:   46c79b04bcf53ebd7911f2e66160e536bf788a05
commit: 47374f44c20b523fd24681d98f2414f2dc3efa63 [67/160] netfilter: nft_pa=
yload: support for inner header matching / mangling
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> net/netfilter/nft_payload.c: linux/ip.h is included more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2446346465934058424==--

