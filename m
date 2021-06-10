Content-Type: multipart/mixed; boundary="===============1384637472512513463=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [kvm:queue 154/222] Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/svm.h' differs from latest version at 'arch/x86/include/uapi/asm/svm.h': 113> /* Exit code reserved for hypervisor/software use */
Date: Fri, 11 Jun 2021 03:14:43 +0800
Message-ID: <202106110335.Rxh0zFyB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1384637472512513463==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: kvm(a)vger.kernel.org
CC: Robert Hu <robert.hu@intel.com>
CC: Farrah Chen <farrah.chen@intel.com>
CC: Danmei Wei <danmei.wei@intel.com>
TO: Vineeth Pillai <viremana@linux.microsoft.com>
CC: Paolo Bonzini <pbonzini@redhat.com>

tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
head:   c1dc20e254b421a2463da7f053b37d822788224a
commit: ae3af6a6d7a2713fdb77f745fcc426dacadd84c2 [154/222] KVM: SVM: Softwa=
re reserved fields
:::::: branch date: 3 hours ago
:::::: commit date: 4 hours ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
>> Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/svm.h' di=
ffers from latest version at 'arch/x86/include/uapi/asm/svm.h':  113> /* Ex=
it code reserved for hypervisor/software use */
>> Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/svm.h' di=
ffers from latest version at 'arch/x86/include/uapi/asm/svm.h':  114> #defi=
ne SVM_EXIT_SW				0xf0000000
   Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/svm.h' di=
ffers from latest version at 'arch/x86/include/uapi/asm/svm.h':  115> =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1384637472512513463==--

