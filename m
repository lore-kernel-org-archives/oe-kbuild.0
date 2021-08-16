Content-Type: multipart/mixed; boundary="===============5288056409069136873=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/kvm/svm/svm_ops.h:41:0: warning: syntax error [syntaxError]
Date: Tue, 17 Aug 2021 02:30:56 +0800
Message-ID: <202108170251.LTMkkmEL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5288056409069136873==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Sean Christopherson <seanjc@google.com>
CC: Paolo Bonzini <pbonzini@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7c60610d476766e128cc4284bb6349732cbd6606
commit: 35a7831912f455d7d19b31cd9300e73f585a077b KVM: SVM: Use asm goto to =
handle unexpected #UD on SVM instructions
date:   6 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 6 months ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from arch/x86/kvm/svm/sev.c:
>> arch/x86/kvm/svm/svm_ops.h:41:0: warning: syntax error [syntaxError]
   =

   ^

vim +41 arch/x86/kvm/svm/svm_ops.h

35a7831912f455 Sean Christopherson 2020-12-30  38  =

35a7831912f455 Sean Christopherson 2020-12-30  39  static inline void clgi(=
void)
35a7831912f455 Sean Christopherson 2020-12-30  40  {
35a7831912f455 Sean Christopherson 2020-12-30 @41  	svm_asm(clgi);
35a7831912f455 Sean Christopherson 2020-12-30  42  }
35a7831912f455 Sean Christopherson 2020-12-30  43  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5288056409069136873==--

