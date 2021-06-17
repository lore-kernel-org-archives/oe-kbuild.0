Content-Type: multipart/mixed; boundary="===============2206213017410632560=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linuxppc:topic/ppc-kvm 38/39] Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs from latest version at 'include/uapi/linux/kvm.h': 1085> #define KVM_CAP_PPC_RPT_INVALIDATE 199
Date: Thu, 17 Jun 2021 10:34:43 +0800
Message-ID: <202106171038.nZrND2mi-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2206213017410632560==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Bharata B Rao <bharata@linux.ibm.com>
CC: Michael Ellerman <mpe@ellerman.id.au>
CC: David Gibson <david@gibson.dropbear.id.au>

tree:   https://github.com/linuxppc/linux topic/ppc-kvm
head:   b33808e147489bb2b8da7230b6ceca85e61cf5d7
commit: 036d97b7be70fa962da01312f69b0af99c4c3cec [38/39] KVM: PPC: Book3S H=
V: Add KVM_CAP_PPC_RPT_INVALIDATE capability
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1085> #define KVM_CAP_PPC=
_RPT_INVALIDATE 199

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2206213017410632560==--

