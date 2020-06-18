Content-Type: multipart/mixed; boundary="===============1873623899451578785=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 2/3] printk: add lockless ringbuffer
Date: Fri, 19 Jun 2020 03:41:40 +0800
Message-ID: <202006190326.64fE4xgf%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1873623899451578785==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200618144919.9806-3-john.ogness@linutronix.de>
References: <20200618144919.9806-3-john.ogness@linutronix.de>
TO: John Ogness <john.ogness@linutronix.de>
TO: Petr Mladek <pmladek@suse.com>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
CC: Steven Rostedt <rostedt@goodmis.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Andrea Parri <parri.andrea@gmail.com>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Paul McKenney <paulmck@kernel.org>
CC: kexec(a)lists.infradead.org
CC: linux-kernel(a)vger.kernel.org

Hi John,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linux/master]
[also build test WARNING on linus/master pmladek/for-next v5.8-rc1 next-202=
00618]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use  as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/John-Ogness/printk-replace=
-ringbuffer/20200618-225239
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
1b5044021070efa3259f3e9548dc35d1eb6aa844
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: x86_64-randconfig-m001-20200618 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/printk/printk_ringbuffer.c:1112 prb_reserve() warn: should '1 << (de=
sc_ring->count_bits)' be a 64 bit type?

# https://github.com/0day-ci/linux/commit/2478707d5ead34b63f820636f51d38324=
d427ecc
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 2478707d5ead34b63f820636f51d38324d427ecc
vim +1112 kernel/printk/printk_ringbuffer.c

2478707d5ead34 John Ogness 2020-06-18  1026  =

2478707d5ead34 John Ogness 2020-06-18  1027  /**
2478707d5ead34 John Ogness 2020-06-18  1028   * prb_reserve() - Reserve spa=
ce in the ringbuffer.
2478707d5ead34 John Ogness 2020-06-18  1029   *
2478707d5ead34 John Ogness 2020-06-18  1030   * @e:  The entry structure to=
 setup.
2478707d5ead34 John Ogness 2020-06-18  1031   * @rb: The ringbuffer to rese=
rve data in.
2478707d5ead34 John Ogness 2020-06-18  1032   * @r:  The record structure t=
o allocate buffers for.
2478707d5ead34 John Ogness 2020-06-18  1033   *
2478707d5ead34 John Ogness 2020-06-18  1034   * This is the public function=
 available to writers to reserve data.
2478707d5ead34 John Ogness 2020-06-18  1035   *
2478707d5ead34 John Ogness 2020-06-18  1036   * The writer specifies the te=
xt and dict sizes to reserve by setting the
2478707d5ead34 John Ogness 2020-06-18  1037   * @text_buf_size and @dict_bu=
f_size fields of @r, respectively. Dictionaries
2478707d5ead34 John Ogness 2020-06-18  1038   * are optional, so @dict_buf_=
size is allowed to be 0. To ensure proper
2478707d5ead34 John Ogness 2020-06-18  1039   * initialization of @r, prb_r=
ec_init_wr() should be used.
2478707d5ead34 John Ogness 2020-06-18  1040   *
2478707d5ead34 John Ogness 2020-06-18  1041   * Context: Any context. Disab=
les local interrupts on success.
2478707d5ead34 John Ogness 2020-06-18  1042   * Return: true if at least te=
xt data could be allocated, otherwise false.
2478707d5ead34 John Ogness 2020-06-18  1043   *
2478707d5ead34 John Ogness 2020-06-18  1044   * On success, the fields @inf=
o, @text_buf, @dict_buf of @r will be set by
2478707d5ead34 John Ogness 2020-06-18  1045   * this function and should be=
 filled in by the writer before committing. Also
2478707d5ead34 John Ogness 2020-06-18  1046   * on success, prb_record_text=
_space() can be used on @e to query the actual
2478707d5ead34 John Ogness 2020-06-18  1047   * space used for the text dat=
a block.
2478707d5ead34 John Ogness 2020-06-18  1048   *
2478707d5ead34 John Ogness 2020-06-18  1049   * If the function fails to re=
serve dictionary space (but all else succeeded),
2478707d5ead34 John Ogness 2020-06-18  1050   * it will still report succes=
s. In that case @dict_buf is set to NULL and
2478707d5ead34 John Ogness 2020-06-18  1051   * @dict_buf_size is set to 0.=
 Writers must check this before writing to
2478707d5ead34 John Ogness 2020-06-18  1052   * dictionary space.
2478707d5ead34 John Ogness 2020-06-18  1053   *
2478707d5ead34 John Ogness 2020-06-18  1054   * @info->text_len and @info->=
dict_len will already be set to @text_buf_size
2478707d5ead34 John Ogness 2020-06-18  1055   * and @dict_buf_size, respect=
ively. If dictionary space reservation fails,
2478707d5ead34 John Ogness 2020-06-18  1056   * @info->dict_len is set to 0.
2478707d5ead34 John Ogness 2020-06-18  1057   */
2478707d5ead34 John Ogness 2020-06-18  1058  bool prb_reserve(struct prb_re=
served_entry *e, struct printk_ringbuffer *rb,
2478707d5ead34 John Ogness 2020-06-18  1059  		 struct printk_record *r)
2478707d5ead34 John Ogness 2020-06-18  1060  {
2478707d5ead34 John Ogness 2020-06-18  1061  	struct prb_desc_ring *desc_ri=
ng =3D &rb->desc_ring;
2478707d5ead34 John Ogness 2020-06-18  1062  	struct prb_desc *d;
2478707d5ead34 John Ogness 2020-06-18  1063  	unsigned long id;
2478707d5ead34 John Ogness 2020-06-18  1064  =

2478707d5ead34 John Ogness 2020-06-18  1065  	if (!data_check_size(&rb->tex=
t_data_ring, r->text_buf_size))
2478707d5ead34 John Ogness 2020-06-18  1066  		goto fail;
2478707d5ead34 John Ogness 2020-06-18  1067  =

2478707d5ead34 John Ogness 2020-06-18  1068  	/* Records are allowed to not=
 have dictionaries. */
2478707d5ead34 John Ogness 2020-06-18  1069  	if (r->dict_buf_size) {
2478707d5ead34 John Ogness 2020-06-18  1070  		if (!data_check_size(&rb->di=
ct_data_ring, r->dict_buf_size))
2478707d5ead34 John Ogness 2020-06-18  1071  			goto fail;
2478707d5ead34 John Ogness 2020-06-18  1072  	}
2478707d5ead34 John Ogness 2020-06-18  1073  =

2478707d5ead34 John Ogness 2020-06-18  1074  	/*
2478707d5ead34 John Ogness 2020-06-18  1075  	 * Descriptors in the reserve=
d state act as blockers to all further
2478707d5ead34 John Ogness 2020-06-18  1076  	 * reservations once the desc=
_ring has fully wrapped. Disable
2478707d5ead34 John Ogness 2020-06-18  1077  	 * interrupts during the rese=
rve/commit window in order to minimize
2478707d5ead34 John Ogness 2020-06-18  1078  	 * the likelihood of this hap=
pening.
2478707d5ead34 John Ogness 2020-06-18  1079  	 */
2478707d5ead34 John Ogness 2020-06-18  1080  	local_irq_save(e->irqflags);
2478707d5ead34 John Ogness 2020-06-18  1081  =

2478707d5ead34 John Ogness 2020-06-18  1082  	if (!desc_reserve(rb, &id)) {
2478707d5ead34 John Ogness 2020-06-18  1083  		/* Descriptor reservation fa=
ilures are tracked. */
2478707d5ead34 John Ogness 2020-06-18  1084  		atomic_long_inc(&rb->fail);
2478707d5ead34 John Ogness 2020-06-18  1085  		local_irq_restore(e->irqflag=
s);
2478707d5ead34 John Ogness 2020-06-18  1086  		goto fail;
2478707d5ead34 John Ogness 2020-06-18  1087  	}
2478707d5ead34 John Ogness 2020-06-18  1088  =

2478707d5ead34 John Ogness 2020-06-18  1089  	d =3D to_desc(desc_ring, id);
2478707d5ead34 John Ogness 2020-06-18  1090  =

2478707d5ead34 John Ogness 2020-06-18  1091  	/*
2478707d5ead34 John Ogness 2020-06-18  1092  	 * Set the @e fields here so =
that prb_commit() can be used if
2478707d5ead34 John Ogness 2020-06-18  1093  	 * text data allocation fails.
2478707d5ead34 John Ogness 2020-06-18  1094  	 */
2478707d5ead34 John Ogness 2020-06-18  1095  	e->rb =3D rb;
2478707d5ead34 John Ogness 2020-06-18  1096  	e->id =3D id;
2478707d5ead34 John Ogness 2020-06-18  1097  =

2478707d5ead34 John Ogness 2020-06-18  1098  	/*
2478707d5ead34 John Ogness 2020-06-18  1099  	 * Initialize the sequence nu=
mber if it has "never been set".
2478707d5ead34 John Ogness 2020-06-18  1100  	 * Otherwise just increment i=
t by a full wrap.
2478707d5ead34 John Ogness 2020-06-18  1101  	 *
2478707d5ead34 John Ogness 2020-06-18  1102  	 * @seq is considered "never =
been set" if it has a value of 0,
2478707d5ead34 John Ogness 2020-06-18  1103  	 * _except_ for @descs[0], wh=
ich was specially setup by the ringbuffer
2478707d5ead34 John Ogness 2020-06-18  1104  	 * initializer and therefore =
is always considered as set.
2478707d5ead34 John Ogness 2020-06-18  1105  	 *
2478707d5ead34 John Ogness 2020-06-18  1106  	 * See the "Bootstrap" commen=
t block in printk_ringbuffer.h for
2478707d5ead34 John Ogness 2020-06-18  1107  	 * details about how the init=
ializer bootstraps the descriptors.
2478707d5ead34 John Ogness 2020-06-18  1108  	 */
2478707d5ead34 John Ogness 2020-06-18  1109  	if (d->info.seq =3D=3D 0 && D=
ESC_INDEX(desc_ring, id) !=3D 0)
2478707d5ead34 John Ogness 2020-06-18  1110  		d->info.seq =3D DESC_INDEX(d=
esc_ring, id);
2478707d5ead34 John Ogness 2020-06-18  1111  	else
2478707d5ead34 John Ogness 2020-06-18 @1112  		d->info.seq +=3D DESCS_COUNT=
(desc_ring);
2478707d5ead34 John Ogness 2020-06-18  1113  =

2478707d5ead34 John Ogness 2020-06-18  1114  	r->text_buf =3D data_alloc(rb=
, &rb->text_data_ring, r->text_buf_size,
2478707d5ead34 John Ogness 2020-06-18  1115  				 &d->text_blk_lpos, id);
2478707d5ead34 John Ogness 2020-06-18  1116  	/* If text data allocation fa=
ils, a data-less record is committed. */
2478707d5ead34 John Ogness 2020-06-18  1117  	if (r->text_buf_size && !r->t=
ext_buf) {
2478707d5ead34 John Ogness 2020-06-18  1118  		d->info.text_len =3D 0;
2478707d5ead34 John Ogness 2020-06-18  1119  		d->info.dict_len =3D 0;
2478707d5ead34 John Ogness 2020-06-18  1120  		prb_commit(e);
2478707d5ead34 John Ogness 2020-06-18  1121  		/* prb_commit() re-enabled i=
nterrupts. */
2478707d5ead34 John Ogness 2020-06-18  1122  		goto fail;
2478707d5ead34 John Ogness 2020-06-18  1123  	}
2478707d5ead34 John Ogness 2020-06-18  1124  =

2478707d5ead34 John Ogness 2020-06-18  1125  	r->dict_buf =3D data_alloc(rb=
, &rb->dict_data_ring, r->dict_buf_size,
2478707d5ead34 John Ogness 2020-06-18  1126  				 &d->dict_blk_lpos, id);
2478707d5ead34 John Ogness 2020-06-18  1127  	/*
2478707d5ead34 John Ogness 2020-06-18  1128  	 * If dict data allocation fa=
ils, the caller can still commit
2478707d5ead34 John Ogness 2020-06-18  1129  	 * text. But dictionary infor=
mation will not be available.
2478707d5ead34 John Ogness 2020-06-18  1130  	 */
2478707d5ead34 John Ogness 2020-06-18  1131  	if (r->dict_buf_size && !r->d=
ict_buf)
2478707d5ead34 John Ogness 2020-06-18  1132  		r->dict_buf_size =3D 0;
2478707d5ead34 John Ogness 2020-06-18  1133  =

2478707d5ead34 John Ogness 2020-06-18  1134  	r->info =3D &d->info;
2478707d5ead34 John Ogness 2020-06-18  1135  =

2478707d5ead34 John Ogness 2020-06-18  1136  	/* Set default values for the=
 sizes. */
2478707d5ead34 John Ogness 2020-06-18  1137  	d->info.text_len =3D r->text_=
buf_size;
2478707d5ead34 John Ogness 2020-06-18  1138  	d->info.dict_len =3D r->dict_=
buf_size;
2478707d5ead34 John Ogness 2020-06-18  1139  =

2478707d5ead34 John Ogness 2020-06-18  1140  	/* Record full text space use=
d by record. */
2478707d5ead34 John Ogness 2020-06-18  1141  	e->text_space =3D space_used(=
&rb->text_data_ring, &d->text_blk_lpos);
2478707d5ead34 John Ogness 2020-06-18  1142  =

2478707d5ead34 John Ogness 2020-06-18  1143  	return true;
2478707d5ead34 John Ogness 2020-06-18  1144  fail:
2478707d5ead34 John Ogness 2020-06-18  1145  	/* Make it clear to the calle=
r that the reserve failed. */
2478707d5ead34 John Ogness 2020-06-18  1146  	memset(r, 0, sizeof(*r));
2478707d5ead34 John Ogness 2020-06-18  1147  	return false;
2478707d5ead34 John Ogness 2020-06-18  1148  }
2478707d5ead34 John Ogness 2020-06-18  1149  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1873623899451578785==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
INPhkF/UjleifIL7H30ER0hNyAEA
--===============1873623899451578785==--

