Content-Type: multipart/mixed; boundary="===============6135007060775204175=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [trace:ftrace/text-poke 1/6] arch/x86/kernel/alternative.c:1098 text_poke_bp_batch() warn: impossible condition '(tp[i]->text[0] == 204) => ((-128)-127 == 204)'
Date: Wed, 09 Oct 2019 12:09:56 +0300
Message-ID: <20191009090956.GB13286@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6135007060775204175==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace=
.git ftrace/text-poke
head:   5225ef2a7a2d3da9e00d3f3439c768ac535f7595
commit: fedc230ef3ea89ea0b308b667e72c3ed2c02dc72 [1/6] x86/alternatives: Te=
ach text_poke_bp() to emulate instructions

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
arch/x86/kernel/alternative.c:1098 text_poke_bp_batch() warn: impossible co=
ndition '(tp[i]->text[0] =3D=3D 204) =3D> ((-128)-127 =3D=3D 204)'

# https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git/c=
ommit/?id=3Dfedc230ef3ea89ea0b308b667e72c3ed2c02dc72
git remote add trace https://git.kernel.org/pub/scm/linux/kernel/git/rosted=
t/linux-trace.git
git remote update trace
git checkout fedc230ef3ea89ea0b308b667e72c3ed2c02dc72
vim +1098 arch/x86/kernel/alternative.c

c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  1047  void text_poke_=
bp_batch(struct text_poke_loc *tp, unsigned int nr_entries)
fd4363fff3d967 Jiri Kosina                2013-07-12  1048  {
fedc230ef3ea89 Peter Zijlstra             2019-10-07  1049  	unsigned char =
int3 =3D INT3_INSN_OPCODE;
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  1050  	unsigned int i;
fedc230ef3ea89 Peter Zijlstra             2019-10-07  1051  	int do_sync;
9222f606506c5f Jiri Kosina                2018-08-28  1052  =

9222f606506c5f Jiri Kosina                2018-08-28  1053  	lockdep_assert=
_held(&text_mutex);
9222f606506c5f Jiri Kosina                2018-08-28  1054  =

c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  1055  	bp_patching.ve=
c =3D tp;
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  1056  	bp_patching.nr=
_entries =3D nr_entries;
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  1057  =

fd4363fff3d967 Jiri Kosina                2013-07-12  1058  	/*
01651324edad9d Peter Zijlstra             2017-07-31  1059  	 * Correspondi=
ng read barrier in int3 notifier for making sure the
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  1060  	 * nr_entries =
and handler are correctly ordered wrt. patching.
fd4363fff3d967 Jiri Kosina                2013-07-12  1061  	 */
fd4363fff3d967 Jiri Kosina                2013-07-12  1062  	smp_wmb();
fd4363fff3d967 Jiri Kosina                2013-07-12  1063  =

c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  1064  	/*
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  1065  	 * First step:=
 add a int3 trap to the address that will be patched.
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  1066  	 */
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  1067  	for (i =3D 0; =
i < nr_entries; i++)
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  1068  		text_poke(tp[=
i].addr, &int3, sizeof(int3));
fd4363fff3d967 Jiri Kosina                2013-07-12  1069  =

fd4363fff3d967 Jiri Kosina                2013-07-12  1070  	on_each_cpu(do=
_sync_core, NULL, 1);
fd4363fff3d967 Jiri Kosina                2013-07-12  1071  =

c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  1072  	/*
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  1073  	 * Second step=
: update all but the first byte of the patched range.
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  1074  	 */
fedc230ef3ea89 Peter Zijlstra             2019-10-07  1075  	for (do_sync =
=3D 0, i =3D 0; i < nr_entries; i++) {
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  1076  		if (tp[i].len=
 - sizeof(int3) > 0) {
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  1077  			text_poke((c=
har *)tp[i].addr + sizeof(int3),
fedc230ef3ea89 Peter Zijlstra             2019-10-07  1078  				  (const ch=
ar *)tp[i].text + sizeof(int3),
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  1079  				  tp[i].len=
 - sizeof(int3));
fedc230ef3ea89 Peter Zijlstra             2019-10-07  1080  			do_sync++;
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  1081  		}
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  1082  	}
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  1083  =

fedc230ef3ea89 Peter Zijlstra             2019-10-07  1084  	if (do_sync) {
fd4363fff3d967 Jiri Kosina                2013-07-12  1085  		/*
fd4363fff3d967 Jiri Kosina                2013-07-12  1086  		 * According =
to Intel, this core syncing is very likely
fd4363fff3d967 Jiri Kosina                2013-07-12  1087  		 * not necess=
ary and we'd be safe even without it. But
fd4363fff3d967 Jiri Kosina                2013-07-12  1088  		 * better saf=
e than sorry (plus there's not only Intel).
fd4363fff3d967 Jiri Kosina                2013-07-12  1089  		 */
fd4363fff3d967 Jiri Kosina                2013-07-12  1090  		on_each_cpu(d=
o_sync_core, NULL, 1);
fd4363fff3d967 Jiri Kosina                2013-07-12  1091  	}
fd4363fff3d967 Jiri Kosina                2013-07-12  1092  =

c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  1093  	/*
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  1094  	 * Third step:=
 replace the first byte (int3) by the first byte of
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  1095  	 * replacing o=
pcode.
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  1096  	 */
fedc230ef3ea89 Peter Zijlstra             2019-10-07  1097  	for (do_sync =
=3D 0, i =3D 0; i < nr_entries; i++) {
fedc230ef3ea89 Peter Zijlstra             2019-10-07 @1098  		if (tp[i].tex=
t[0] =3D=3D INT3_INSN_OPCODE)
                                                                           =
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Impossible condition.  .text[] is signed char and INT3_INSN_OPCODE is
0xCC.

fedc230ef3ea89 Peter Zijlstra             2019-10-07  1099  			continue;
fd4363fff3d967 Jiri Kosina                2013-07-12  1100  =

fedc230ef3ea89 Peter Zijlstra             2019-10-07  1101  		text_poke(tp[=
i].addr, tp[i].text, sizeof(int3));
fedc230ef3ea89 Peter Zijlstra             2019-10-07  1102  		do_sync++;
fedc230ef3ea89 Peter Zijlstra             2019-10-07  1103  	}
fedc230ef3ea89 Peter Zijlstra             2019-10-07  1104  =

fedc230ef3ea89 Peter Zijlstra             2019-10-07  1105  	if (do_sync)
fd4363fff3d967 Jiri Kosina                2013-07-12  1106  		on_each_cpu(d=
o_sync_core, NULL, 1);
fedc230ef3ea89 Peter Zijlstra             2019-10-07  1107  =

01651324edad9d Peter Zijlstra             2017-07-31  1108  	/*
01651324edad9d Peter Zijlstra             2017-07-31  1109  	 * sync_core()=
 implies an smp_mb() and orders this store against
01651324edad9d Peter Zijlstra             2017-07-31  1110  	 * the writing=
 of the new instruction.
01651324edad9d Peter Zijlstra             2017-07-31  1111  	 */
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  1112  	bp_patching.ve=
c =3D NULL;
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  1113  	bp_patching.nr=
_entries =3D 0;
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  1114  }
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  1115  =


---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/kbuild-all                   Intel Corporati=
on
--===============6135007060775204175==--

