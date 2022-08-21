Content-Type: multipart/mixed; boundary="===============1375465895315177300=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/4] riscv: Introduce support for defining instructions
Date: Sun, 21 Aug 2022 12:37:50 +0800
Message-ID: <202208211258.yJSqvQGj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1375465895315177300==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220819140250.3892995-3-ajones@ventanamicro.com>
References: <20220819140250.3892995-3-ajones@ventanamicro.com>
TO: Andrew Jones <ajones@ventanamicro.com>
TO: linux-riscv(a)lists.infradead.org
TO: kvm-riscv(a)lists.infradead.org
CC: linux-kernel(a)vger.kernel.org
CC: paul.walmsley(a)sifive.com
CC: palmer(a)dabbelt.com
CC: aou(a)eecs.berkeley.edu
CC: anup(a)brainfault.org
CC: mchitale(a)ventanamicro.com
CC: heiko(a)sntech.de

Hi Andrew,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.0-rc1 next-20220819]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrew-Jones/riscv-I=
ntroduce-support-for-defining-instructions/20220819-220611
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
4c2d0b039c5cc0112206a5b22431b577cb1c57ad
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> arch/riscv/include/asm/insn-def.h: asm/gpr-num.h is included more than o=
nce.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1375465895315177300==--

