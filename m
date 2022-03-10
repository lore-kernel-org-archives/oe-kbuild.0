Content-Type: multipart/mixed; boundary="===============3908686841867102396=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [kvm:queue 182/205] /tmp/ccaTFGDk.s:61: Error: invalid operands (*UND* and .data..percpu sections) for `+'
Date: Thu, 10 Mar 2022 09:28:15 +0800
Message-ID: <202203100925.Qj9KnV3H-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3908686841867102396==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: kvm(a)vger.kernel.org
CC: Robert Hu <robert.hu@intel.com>
CC: Farrah Chen <farrah.chen@intel.com>
CC: Danmei Wei <danmei.wei@intel.com>
TO: Li RongQing <lirongqing@baidu.com>
CC: Paolo Bonzini <pbonzini@redhat.com>

tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
head:   8c1db5a775bc8314d78e99263e0d063a01b692c2
commit: 4ab22f38c2046f2c949cb43fc0f7515666a2a2fb [182/205] KVM: x86: Suppor=
t the vCPU preemption check with nopvspin and realtime hint
:::::: branch date: 12 hours ago
:::::: commit date: 16 hours ago
config: x86_64-randconfig-s022 (https://download.01.org/0day-ci/archive/202=
20310/202203100925.Qj9KnV3H-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/virt/kvm/kvm.git/commit/?id=3D4ab2=
2f38c2046f2c949cb43fc0f7515666a2a2fb
        git remote add kvm https://git.kernel.org/pub/scm/virt/kvm/kvm.git
        git fetch --no-tags kvm queue
        git checkout 4ab22f38c2046f2c949cb43fc0f7515666a2a2fb
        # save the config file to linux build tree
        mkdir build_dir
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Dx86_64 SHELL=3D/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   /tmp/ccaTFGDk.s: Assembler messages:
>> /tmp/ccaTFGDk.s:61: Error: invalid operands (*UND* and .data..percpu sec=
tions) for `+'

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3908686841867102396==--

