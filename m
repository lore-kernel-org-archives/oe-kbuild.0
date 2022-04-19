Content-Type: multipart/mixed; boundary="===============0831034649687010645=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 7/8] test_firmware: Error injection for firmware upload
Date: Tue, 19 Apr 2022 21:01:45 +0800
Message-ID: <202204192004.EetsOFcB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0831034649687010645==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220418223753.639058-8-russell.h.weight@intel.com>
References: <20220418223753.639058-8-russell.h.weight@intel.com>
TO: Russ Weight <russell.h.weight@intel.com>
TO: mcgrof(a)kernel.org
TO: rafael(a)kernel.org
TO: linux-kernel(a)vger.kernel.org
CC: trix(a)redhat.com
CC: lgoncalv(a)redhat.com
CC: yilun.xu(a)intel.com
CC: hao.wu(a)intel.com
CC: matthew.gerlach(a)linux.intel.com
CC: basheer.ahmed.muddebihal(a)intel.com
CC: tianfei.zhang(a)intel.com
CC: Russ Weight <russell.h.weight@intel.com>

Hi Russ,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on driver-core/driver-core-testing]
[also build test WARNING on shuah-kselftest/next mcgrof/sysctl-next linus/m=
aster v5.18-rc3 next-20220419]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Russ-Weight/Extend-F=
W-framework-for-user-FW-uploads/20220419-064126
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.=
git 3123109284176b1532874591f7c81f3837bbdc17
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
compiler: mipsel-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 2cf984eba934c1a6b1bcfc317886e89180bcb5e3
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> lib/test_firmware.c:1071:18: warning: Uninitialized variables: tst.name,=
 tst.buf, tst.size, tst.cancel_request, tst.inject, tst.fwl [uninitvar]
     upload_release(tst);
                    ^

vim +1071 lib/test_firmware.c

cb4d12e8d75964 Russ Weight 2022-04-18  1064  =

cb4d12e8d75964 Russ Weight 2022-04-18  1065  static void upload_release_all=
(void)
cb4d12e8d75964 Russ Weight 2022-04-18  1066  {
cb4d12e8d75964 Russ Weight 2022-04-18  1067  	struct test_firmware_upload *=
tst, *tmp;
cb4d12e8d75964 Russ Weight 2022-04-18  1068  =

cb4d12e8d75964 Russ Weight 2022-04-18  1069  	list_for_each_entry_safe(tst,=
 tmp, &test_upload_list, node) {
cb4d12e8d75964 Russ Weight 2022-04-18  1070  		list_del(&tst->node);
cb4d12e8d75964 Russ Weight 2022-04-18 @1071  		upload_release(tst);
cb4d12e8d75964 Russ Weight 2022-04-18  1072  	}
cb4d12e8d75964 Russ Weight 2022-04-18  1073  	test_fw_config->upload_name =
=3D NULL;
cb4d12e8d75964 Russ Weight 2022-04-18  1074  }
cb4d12e8d75964 Russ Weight 2022-04-18  1075  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0831034649687010645==--

