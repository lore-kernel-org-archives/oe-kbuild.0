Content-Type: multipart/mixed; boundary="===============4070712314152640047=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 297/453] drivers/gpu/drm/vmwgfx/vmwgfx_msg.o: warning: objtool: vmw_port_hb_out()+0xa6: stack state mismatch: cfa1=5+16 cfa2=4+8
Date: Tue, 14 Jun 2022 18:04:47 +0800
Message-ID: <202206141758.kYqRmOR2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4070712314152640047==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.o: warning: objtool: vmw_port_hb_out()+0=
xa6: stack state mismatch: cfa1=3D5+16 cfa2=3D4+8"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Isaku Yamahata <isaku.yamahata@intel.com>

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   64f3ddf316eab9398414b94e62a01d185e6e94c8
commit: 0d5a463b763c81dd381730e11fd24b0c5326758c [297/453] [REVERTME] fix u=
ndefined symbol of cc_init
:::::: branch date: 5 days ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-s021-20220613 (https://download.01.org/0day-ci/ar=
chive/20220614/202206141758.kYqRmOR2-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-30-g92122700-dirty
        # https://github.com/intel/tdx/commit/0d5a463b763c81dd381730e11fd24=
b0c5326758c
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout 0d5a463b763c81dd381730e11fd24b0c5326758c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Dx86_64 SHELL=3D/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/vmwgfx/vmwgfx_msg.o: warning: objtool: vmw_port_hb_in()+=
0xf6: return with modified stack frame
>> drivers/gpu/drm/vmwgfx/vmwgfx_msg.o: warning: objtool: vmw_port_hb_out()=
+0xa6: stack state mismatch: cfa1=3D5+16 cfa2=3D4+8

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4070712314152640047==--

