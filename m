Content-Type: multipart/mixed; boundary="===============0272851781797455279=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/4] net: add an accept helper not installing fd
Date: Wed, 07 Jul 2021 21:07:57 +0800
Message-ID: <202107072042.rTooEihW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0272851781797455279==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <8c0bb671180a8f8375422146eb534bc5ccb2b269.1625657451.git.asml.=
silence@gmail.com>
References: <8c0bb671180a8f8375422146eb534bc5ccb2b269.1625657451.git.asml.s=
ilence@gmail.com>
TO: Pavel Begunkov <asml.silence@gmail.com>
TO: Jens Axboe <axboe@kernel.dk>
TO: io-uring(a)vger.kernel.org
CC: "David S . Miller" <davem@davemloft.net>
CC: Jakub Kicinski <kuba@kernel.org>
CC: linux-kernel(a)vger.kernel.org
CC: netdev(a)vger.kernel.org

Hi Pavel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on next-20210707]
[cannot apply to linus/master v5.13 v5.13-rc7 v5.13-rc6 v5.13]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Pavel-Begunkov/open-accept=
-directly-into-io_uring-fixed-file-table/20210707-194341
base:    ee268dee405b4710e179426a431ffe0cdee14f13
:::::: branch date: 84 minutes ago
:::::: commit date: 84 minutes ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
>> Warning: Kernel ABI header at 'tools/perf/trace/beauty/include/linux/soc=
ket.h' differs from latest version at 'include/linux/socket.h':  424> exter=
n struct file *do_accept(struct file *file, unsigned file_flags,
>> Warning: Kernel ABI header at 'tools/perf/trace/beauty/include/linux/soc=
ket.h' differs from latest version at 'include/linux/socket.h':  425> 			  =
    struct sockaddr __user *upeer_sockaddr,
>> Warning: Kernel ABI header at 'tools/perf/trace/beauty/include/linux/soc=
ket.h' differs from latest version at 'include/linux/socket.h':  426> 			  =
    int __user *upeer_addrlen, int flags);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0272851781797455279==--

