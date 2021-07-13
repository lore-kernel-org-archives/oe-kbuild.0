Content-Type: multipart/mixed; boundary="===============4235159964934138489=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] move_mount: allow to add a mount into an existing group
Date: Tue, 13 Jul 2021 21:51:21 +0800
Message-ID: <202107132110.o2RxWPRF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4235159964934138489==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210713115636.352504-1-ptikhomirov@virtuozzo.com>
References: <20210713115636.352504-1-ptikhomirov@virtuozzo.com>
TO: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
TO: Christian Brauner <christian.brauner@ubuntu.com>
TO: linux-fsdevel(a)vger.kernel.org
CC: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
CC: "Eric W . Biederman" <ebiederm@xmission.com>
CC: Alexander Viro <viro@zeniv.linux.org.uk>
CC: Mattias Nissler <mnissler@chromium.org>
CC: Aleksa Sarai <cyphar@cyphar.com>
CC: Andrei Vagin <avagin@gmail.com>
CC: linux-api(a)vger.kernel.org
CC: lkml <linux-kernel@vger.kernel.org>

Hi Pavel,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.14-rc1 next-20210713]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Pavel-Tikhomirov/move_moun=
t-allow-to-add-a-mount-into-an-existing-group/20210713-195800
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
7fef2edf7cc753b51f7ccc74993971b0a9c81eca
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/mount.h' differs=
 from latest version at 'include/uapi/linux/mount.h':   76< #define MOVE_MO=
UNT__MASK		0x00000077
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/mount.h' differs=
 from latest version at 'include/uapi/linux/mount.h':   76> #define MOVE_MO=
UNT_SET_GROUP		0x00000100 /* Set sharing group instead */
   Warning: Kernel ABI header at 'tools/include/uapi/linux/mount.h' differs=
 from latest version at 'include/uapi/linux/mount.h':   77> #define MOVE_MO=
UNT__MASK		0x00000177

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4235159964934138489==--

