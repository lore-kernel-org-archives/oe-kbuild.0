Content-Type: multipart/mixed; boundary="===============6019536480065001268=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH bpf-next v8 09/10] selftests/bpf: Extend kfunc selftests
Date: Sat, 22 Jan 2022 17:03:00 +0800
Message-ID: <202201221618.3iotxtfv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6019536480065001268==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220114163953.1455836-10-memxor@gmail.com>
References: <20220114163953.1455836-10-memxor@gmail.com>
TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>

Hi Kumar,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Kumar-Kartikeya-Dwivedi/In=
troduce-unstable-CT-lookup-helpers/20220115-004219
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: x86_64-randconfig-c022-20220117 (https://download.01.org/0day-ci/ar=
chive/20220122/202201221618.3iotxtfv-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> net/bpf/test_run.c:296:6-10: WARNING use flexible-array member instead (=
https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-=
and-one-element-arrays)

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6019536480065001268==--

