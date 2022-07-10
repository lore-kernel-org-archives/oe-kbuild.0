Content-Type: multipart/mixed; boundary="===============5397033676004565305=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [kvms390:pci 13/21] arch/s390/kvm/pci.h: linux/kvm_host.h is included more than once.
Date: Sun, 10 Jul 2022 21:04:36 +0800
Message-ID: <202207102117.Guvcj88e-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5397033676004565305==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-s390(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
TO: Matthew Rosato <mjrosato@linux.ibm.com>
CC: Christian Borntraeger <borntraeger@linux.ibm.com>
CC: Pierre Morel <pmorel@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux.git p=
ci
head:   a25db9e809eca94795b7b030dcd08a9365a96bf8
commit: 834c4bfa5b5c2c6bb08cda43adf16179bf9161c3 [13/21] KVM: s390: pci: en=
able host forwarding of Adapter Event Notifications
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> arch/s390/kvm/pci.h: linux/kvm_host.h is included more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5397033676004565305==--

