Content-Type: multipart/mixed; boundary="===============3788976696163480988=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jolsa-perf:bpf/tramp_27 19/33] include/linux/bpf.h: linux/refcount.h is included more than once.
Date: Mon, 11 Jul 2022 12:44:09 +0800
Message-ID: <202207111228.MrXFMOmS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3788976696163480988==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jiri Olsa <jolsa@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/=
tramp_27
head:   08201713df8992b94d140b43fd4f20f1ad4aedb3
commit: 4e0c494bd2718df080d359785317d2b9234a79be [19/33] bpf: Add refcount_=
t to struct bpf_tramp_id
:::::: branch date: 13 hours ago
:::::: commit date: 14 hours ago
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> include/linux/bpf.h: linux/refcount.h is included more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3788976696163480988==--

