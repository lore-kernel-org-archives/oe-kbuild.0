Content-Type: multipart/mixed; boundary="===============4360968974118645882=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [atishp04:kvm_perf_rfc 20/24] arch/riscv/kvm/vcpu_pmu.c: linux/kvm_host.h is included more than once.
Date: Sun, 17 Jul 2022 00:31:33 +0800
Message-ID: <202207170053.sH7IEl7J-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4360968974118645882==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Atish Patra <Atish.Patra@wdc.com>
CC: linux-kernel(a)vger.kernel.org
TO: Atish Patra <atishp@rivosinc.com>

tree:   https://github.com/atishp04/linux kvm_perf_rfc
head:   84a3fd7f92957f64c411595a9efcc2eed18db2be
commit: bb00c153861bc5d86bab2b4335f3f0e1ca970925 [20/24] RISC-V: KVM: Add s=
keleton support for perf
:::::: branch date: 14 hours ago
:::::: commit date: 15 hours ago
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> arch/riscv/kvm/vcpu_pmu.c: linux/kvm_host.h is included more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4360968974118645882==--

