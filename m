Content-Type: multipart/mixed; boundary="===============8687618830833081308=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/riscv/kernel/jump_label.c:30:44: warning: Same expression on both sides of '-'.
Date: Sat, 03 Oct 2020 07:14:10 +0800
Message-ID: <202010030705.mxgqoVhq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8687618830833081308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Emil Renner Berthing <kernel@esmil.dk>
CC: Palmer Dabbelt <palmerdabbelt@google.com>
CC: "Bj=C3=B6rn T=C3=B6pel" <bjorn.topel@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   472e5b056f000a778abb41f1e443de58eb259783
commit: ebc00dde8a975a543f5e1a7cdac93fef89fefe58 riscv: Add jump-label impl=
ementation
date:   9 weeks ago
:::::: branch date: 21 hours ago
:::::: commit date: 9 weeks ago
compiler: riscv32-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


vim +30 arch/riscv/kernel/jump_label.c

ebc00dde8a975a5 Emil Renner Berthing 2020-07-14  16  =

ebc00dde8a975a5 Emil Renner Berthing 2020-07-14  17  void arch_jump_label_t=
ransform(struct jump_entry *entry,
ebc00dde8a975a5 Emil Renner Berthing 2020-07-14  18  			       enum jump_la=
bel_type type)
ebc00dde8a975a5 Emil Renner Berthing 2020-07-14  19  {
ebc00dde8a975a5 Emil Renner Berthing 2020-07-14  20  	void *addr =3D (void =
*)jump_entry_code(entry);
ebc00dde8a975a5 Emil Renner Berthing 2020-07-14  21  	u32 insn;
ebc00dde8a975a5 Emil Renner Berthing 2020-07-14  22  =

ebc00dde8a975a5 Emil Renner Berthing 2020-07-14  23  	if (type =3D=3D JUMP_=
LABEL_JMP) {
ebc00dde8a975a5 Emil Renner Berthing 2020-07-14  24  		long offset =3D jump=
_entry_target(entry) - jump_entry_code(entry);
ebc00dde8a975a5 Emil Renner Berthing 2020-07-14  25  =

ebc00dde8a975a5 Emil Renner Berthing 2020-07-14  26  		if (WARN_ON(offset &=
 1 || offset < -524288 || offset >=3D 524288))
ebc00dde8a975a5 Emil Renner Berthing 2020-07-14  27  			return;
ebc00dde8a975a5 Emil Renner Berthing 2020-07-14  28  =

ebc00dde8a975a5 Emil Renner Berthing 2020-07-14  29  		insn =3D RISCV_INSN_=
JAL |
ebc00dde8a975a5 Emil Renner Berthing 2020-07-14 @30  			(((u32)offset & GEN=
MASK(19, 12)) << (12 - 12)) |
ebc00dde8a975a5 Emil Renner Berthing 2020-07-14  31  			(((u32)offset & GEN=
MASK(11, 11)) << (20 - 11)) |
ebc00dde8a975a5 Emil Renner Berthing 2020-07-14  32  			(((u32)offset & GEN=
MASK(10,  1)) << (21 -  1)) |
ebc00dde8a975a5 Emil Renner Berthing 2020-07-14  33  			(((u32)offset & GEN=
MASK(20, 20)) << (31 - 20));
ebc00dde8a975a5 Emil Renner Berthing 2020-07-14  34  	} else {
ebc00dde8a975a5 Emil Renner Berthing 2020-07-14  35  		insn =3D RISCV_INSN_=
NOP;
ebc00dde8a975a5 Emil Renner Berthing 2020-07-14  36  	}
ebc00dde8a975a5 Emil Renner Berthing 2020-07-14  37  =

ebc00dde8a975a5 Emil Renner Berthing 2020-07-14  38  	mutex_lock(&text_mute=
x);
ebc00dde8a975a5 Emil Renner Berthing 2020-07-14  39  	patch_text_nosync(add=
r, &insn, sizeof(insn));
ebc00dde8a975a5 Emil Renner Berthing 2020-07-14  40  	mutex_unlock(&text_mu=
tex);
ebc00dde8a975a5 Emil Renner Berthing 2020-07-14  41  }
ebc00dde8a975a5 Emil Renner Berthing 2020-07-14  42  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============8687618830833081308==--

