Content-Type: multipart/mixed; boundary="===============1166032570048959231=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/kvm/svm/svm_ops.h:41:0: warning: syntax error [syntaxError]
Date: Sat, 10 Jul 2021 15:09:10 +0800
Message-ID: <202107101503.U521fjsV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1166032570048959231==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Sean Christopherson <seanjc@google.com>
CC: Paolo Bonzini <pbonzini@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   50be9417e23af5a8ac860d998e1e3f06b8fd79d7
commit: 35a7831912f455d7d19b31cd9300e73f585a077b KVM: SVM: Use asm goto to =
handle unexpected #UD on SVM instructions
date:   5 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 5 months ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

       ^
>> arch/x86/kvm/x86.c:4464:29: warning: Opposite expression on both sides o=
f '&'. [oppositeExpression]
     u64 xfeature_mask =3D valid & -valid;
                               ^
   arch/x86/kvm/x86.c:4507:29: warning: Opposite expression on both sides o=
f '&'. [oppositeExpression]
     u64 xfeature_mask =3D valid & -valid;
                               ^
>> arch/x86/kvm/x86.c:467:11: warning: Shifting signed 32-bit value by 31 b=
its is undefined behaviour. See condition at line 464. [shiftTooManyBitsSig=
ned]
    mask =3D 1 << vector;
             ^
   arch/x86/kvm/x86.c:464:21: note: Assuming that condition 'vector>31' is =
not redundant
    if (WARN_ON(vector > 31 || vector =3D=3D NMI_VECTOR))
                       ^
   arch/x86/kvm/x86.c:467:11: note: Shift
    mask =3D 1 << vector;
             ^
>> arch/x86/kvm/x86.c:6112:6: warning: Buffer is accessed out of bounds: kv=
m_emulate_prefix [bufferAccessOutOfBounds]
        memcmp(sig, kvm_emulate_prefix, sizeof(sig)) =3D=3D 0) {
        ^
--
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
--===============1166032570048959231==--

