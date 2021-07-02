Content-Type: multipart/mixed; boundary="===============7295911888060180117=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [android-common:android13-5.10 10947/10965] Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs from latest version at 'include/uapi/linux/kvm.h': 1057> #define KVM_CAP_SYS_HYPERV_CPUID 191
Date: Fri, 02 Jul 2021 19:27:03 +0800
Message-ID: <202107021955.bGyK1qs4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7295911888060180117==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   d870ecaadb2299dadfb8ed3993b731e37d3cbc21
commit: a669f441f8f5e2b4eff9d90f41043e1b4693d7c6 [10947/10965] BACKPORT: KV=
M: arm64: Add support for the KVM PTP service
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1056> /*
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1057> #define KVM_CAP_SYS=
_HYPERV_CPUID 191
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1058> #define KVM_CAP_DIR=
TY_LOG_RING 192
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1059> #define KVM_CAP_X86=
_BUS_LOCK_EXIT 193
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1060> #define KVM_CAP_PPC=
_DAWR1 194
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1061> */
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1062> #define KVM_CAP_PTP=
_KVM 195

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7295911888060180117==--

