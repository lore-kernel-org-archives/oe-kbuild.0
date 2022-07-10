Content-Type: multipart/mixed; boundary="===============3478290659117975379=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH v2] vmxnet3: Add XDP support.
Date: Sun, 10 Jul 2022 18:42:00 +0800
Message-ID: <202207101853.ZmcCnmhe-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3478290659117975379==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220707133335.68987-1-u9012063@gmail.com>
References: <20220707133335.68987-1-u9012063@gmail.com>
TO: William Tu <u9012063@gmail.com>

Hi William,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on next-20220707]
[cannot apply to horms-ipvs/master linus/master v5.19-rc5 v5.19-rc4 v5.19-r=
c3 v5.19-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/William-Tu/vmxnet3-A=
dd-XDP-support/20220707-213553
base:    75d7bf5eae277f32dd952276aa41ae7915dba1b2
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> drivers/net/vmxnet3/vmxnet3_int.h: linux/skbuff.h is included more than =
once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3478290659117975379==--

