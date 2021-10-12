Content-Type: multipart/mixed; boundary="===============6827659621783554668=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH -next] audit: return early if the rule has a lower priority
Date: Wed, 13 Oct 2021 03:05:22 +0800
Message-ID: <202110130344.odiZFWOO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6827659621783554668==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211012013240.63072-1-cuigaosheng1@huawei.com>
References: <20211012013240.63072-1-cuigaosheng1@huawei.com>
TO: Gaosheng Cui <cuigaosheng1@huawei.com>
TO: paul(a)paul-moore.com
TO: eparis(a)redhat.com
CC: linux-audit(a)redhat.com
CC: linux-kernel(a)vger.kernel.org
CC: xiujianfeng(a)huawei.com
CC: wangweiyang2(a)huawei.com

Hi Gaosheng,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on next-20211011]

url:    https://github.com/0day-ci/linux/commits/Gaosheng-Cui/audit-return-=
early-if-the-rule-has-a-lower-priority/20211012-093102
base:    d3134eb5de8546a214c028fb7195e764b89da7d4
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: x86_64-randconfig-m001-20211012 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/auditsc.c:653 audit_filter_rules() error: we previously assumed 'ctx=
' could be null (see line 473)

vim +/ctx +653 kernel/auditsc.c

02d86a568c6d2d Eric Paris         2012-01-03  452  =

f368c07d7214a7 Amy Griffis        2006-04-07  453  /* Determine if any cont=
ext name data matches a rule's watch data */
^1da177e4c3f41 Linus Torvalds     2005-04-16  454  /* Compare a task_struct=
 with an audit_rule.  Return 1 on match, 0
f562988350361b Tony Jones         2011-04-27  455   * otherwise.
f562988350361b Tony Jones         2011-04-27  456   *
f562988350361b Tony Jones         2011-04-27  457   * If task_creation is t=
rue, this is an explicit indication that we are
f562988350361b Tony Jones         2011-04-27  458   * filtering a task rule=
 at task creation time.  This and tsk =3D=3D current are
f562988350361b Tony Jones         2011-04-27  459   * the only situations w=
here tsk->cred may be accessed without an rcu read lock.
f562988350361b Tony Jones         2011-04-27  460   */
^1da177e4c3f41 Linus Torvalds     2005-04-16  461  static int audit_filter_=
rules(struct task_struct *tsk,
93315ed6dd12da Amy Griffis        2006-02-07  462  			      struct audit_kr=
ule *rule,
^1da177e4c3f41 Linus Torvalds     2005-04-16  463  			      struct audit_co=
ntext *ctx,
f368c07d7214a7 Amy Griffis        2006-04-07  464  			      struct audit_na=
mes *name,
f562988350361b Tony Jones         2011-04-27  465  			      enum audit_stat=
e *state,
f562988350361b Tony Jones         2011-04-27  466  			      bool task_creat=
ion)
^1da177e4c3f41 Linus Torvalds     2005-04-16  467  {
f562988350361b Tony Jones         2011-04-27  468  	const struct cred *cred;
5195d8e217a786 Eric Paris         2012-01-03  469  	int i, need_sid =3D 1;
3dc7e3153eddfc Darrel Goeddel     2006-03-10  470  	u32 sid;
8fae47705685fc Richard Guy Briggs 2016-11-20  471  	unsigned int sessionid;
3dc7e3153eddfc Darrel Goeddel     2006-03-10  472  =

046a8e46eefb9d Gaosheng Cui       2021-10-12 @473  	if (ctx && rule->prio <=
=3D ctx->prio)
046a8e46eefb9d Gaosheng Cui       2021-10-12  474  		return 0;
046a8e46eefb9d Gaosheng Cui       2021-10-12  475  =

f562988350361b Tony Jones         2011-04-27  476  	cred =3D rcu_dereferenc=
e_check(tsk->cred, tsk =3D=3D current || task_creation);
f562988350361b Tony Jones         2011-04-27  477  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  478  	for (i =3D 0; i < rule-=
>field_count; i++) {
93315ed6dd12da Amy Griffis        2006-02-07  479  		struct audit_field *f =
=3D &rule->fields[i];
5195d8e217a786 Eric Paris         2012-01-03  480  		struct audit_names *n;
^1da177e4c3f41 Linus Torvalds     2005-04-16  481  		int result =3D 0;
f1dc4867ff41b7 Richard Guy Briggs 2013-12-11  482  		pid_t pid;
^1da177e4c3f41 Linus Torvalds     2005-04-16  483  =

93315ed6dd12da Amy Griffis        2006-02-07  484  		switch (f->type) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  485  		case AUDIT_PID:
fa2bea2f5cca5b Paul Moore         2016-08-30  486  			pid =3D task_tgid_nr(=
tsk);
f1dc4867ff41b7 Richard Guy Briggs 2013-12-11  487  			result =3D audit_comp=
arator(pid, f->op, f->val);
^1da177e4c3f41 Linus Torvalds     2005-04-16  488  			break;
3c66251e573219 Al Viro            2006-05-06  489  		case AUDIT_PPID:
419c58f11fb732 Alexander Viro     2006-09-29  490  			if (ctx) {
419c58f11fb732 Alexander Viro     2006-09-29  491  				if (!ctx->ppid)
c92cdeb45eea38 Richard Guy Briggs 2013-12-10  492  					ctx->ppid =3D task_=
ppid_nr(tsk);
3c66251e573219 Al Viro            2006-05-06  493  				result =3D audit_com=
parator(ctx->ppid, f->op, f->val);
419c58f11fb732 Alexander Viro     2006-09-29  494  			}
3c66251e573219 Al Viro            2006-05-06  495  			break;
34d99af52ad40b Richard Guy Briggs 2015-08-05  496  		case AUDIT_EXE:
34d99af52ad40b Richard Guy Briggs 2015-08-05  497  			result =3D audit_exe_=
compare(tsk, rule->exe);
23bcc480dac204 Ondrej Mosn=C3=A1=C4=8Dek    2018-04-09  498  			if (f->op =
=3D=3D Audit_not_equal)
23bcc480dac204 Ondrej Mosn=C3=A1=C4=8Dek    2018-04-09  499  				result =3D=
 !result;
34d99af52ad40b Richard Guy Briggs 2015-08-05  500  			break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  501  		case AUDIT_UID:
ca57ec0f00c3f1 Eric W. Biederman  2012-09-11  502  			result =3D audit_uid_=
comparator(cred->uid, f->op, f->uid);
^1da177e4c3f41 Linus Torvalds     2005-04-16  503  			break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  504  		case AUDIT_EUID:
ca57ec0f00c3f1 Eric W. Biederman  2012-09-11  505  			result =3D audit_uid_=
comparator(cred->euid, f->op, f->uid);
^1da177e4c3f41 Linus Torvalds     2005-04-16  506  			break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  507  		case AUDIT_SUID:
ca57ec0f00c3f1 Eric W. Biederman  2012-09-11  508  			result =3D audit_uid_=
comparator(cred->suid, f->op, f->uid);
^1da177e4c3f41 Linus Torvalds     2005-04-16  509  			break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  510  		case AUDIT_FSUID:
ca57ec0f00c3f1 Eric W. Biederman  2012-09-11  511  			result =3D audit_uid_=
comparator(cred->fsuid, f->op, f->uid);
^1da177e4c3f41 Linus Torvalds     2005-04-16  512  			break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  513  		case AUDIT_GID:
ca57ec0f00c3f1 Eric W. Biederman  2012-09-11  514  			result =3D audit_gid_=
comparator(cred->gid, f->op, f->gid);
37eebe39c9731a Matvejchikov Ilya  2011-12-13  515  			if (f->op =3D=3D Audi=
t_equal) {
37eebe39c9731a Matvejchikov Ilya  2011-12-13  516  				if (!result)
af85d1772e31fe Ondrej Mosn=C3=A1=C4=8Dek    2018-06-05  517  					result =
=3D groups_search(cred->group_info, f->gid);
37eebe39c9731a Matvejchikov Ilya  2011-12-13  518  			} else if (f->op =3D=
=3D Audit_not_equal) {
37eebe39c9731a Matvejchikov Ilya  2011-12-13  519  				if (result)
af85d1772e31fe Ondrej Mosn=C3=A1=C4=8Dek    2018-06-05  520  					result =
=3D !groups_search(cred->group_info, f->gid);
37eebe39c9731a Matvejchikov Ilya  2011-12-13  521  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16  522  			break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  523  		case AUDIT_EGID:
ca57ec0f00c3f1 Eric W. Biederman  2012-09-11  524  			result =3D audit_gid_=
comparator(cred->egid, f->op, f->gid);
37eebe39c9731a Matvejchikov Ilya  2011-12-13  525  			if (f->op =3D=3D Audi=
t_equal) {
37eebe39c9731a Matvejchikov Ilya  2011-12-13  526  				if (!result)
af85d1772e31fe Ondrej Mosn=C3=A1=C4=8Dek    2018-06-05  527  					result =
=3D groups_search(cred->group_info, f->gid);
37eebe39c9731a Matvejchikov Ilya  2011-12-13  528  			} else if (f->op =3D=
=3D Audit_not_equal) {
37eebe39c9731a Matvejchikov Ilya  2011-12-13  529  				if (result)
af85d1772e31fe Ondrej Mosn=C3=A1=C4=8Dek    2018-06-05  530  					result =
=3D !groups_search(cred->group_info, f->gid);
37eebe39c9731a Matvejchikov Ilya  2011-12-13  531  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16  532  			break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  533  		case AUDIT_SGID:
ca57ec0f00c3f1 Eric W. Biederman  2012-09-11  534  			result =3D audit_gid_=
comparator(cred->sgid, f->op, f->gid);
^1da177e4c3f41 Linus Torvalds     2005-04-16  535  			break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  536  		case AUDIT_FSGID:
ca57ec0f00c3f1 Eric W. Biederman  2012-09-11  537  			result =3D audit_gid_=
comparator(cred->fsgid, f->op, f->gid);
^1da177e4c3f41 Linus Torvalds     2005-04-16  538  			break;
8fae47705685fc Richard Guy Briggs 2016-11-20  539  		case AUDIT_SESSIONID:
5b71388663c092 Ondrej Mosn=C3=A1=C4=8Dek    2018-05-17  540  			sessionid =
=3D audit_get_sessionid(tsk);
8fae47705685fc Richard Guy Briggs 2016-11-20  541  			result =3D audit_comp=
arator(sessionid, f->op, f->val);
8fae47705685fc Richard Guy Briggs 2016-11-20  542  			break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  543  		case AUDIT_PERS:
93315ed6dd12da Amy Griffis        2006-02-07  544  			result =3D audit_comp=
arator(tsk->personality, f->op, f->val);
^1da177e4c3f41 Linus Torvalds     2005-04-16  545  			break;
2fd6f58ba6efc8 David Woodhouse    2005-04-29  546  		case AUDIT_ARCH:
2fd6f58ba6efc8 David Woodhouse    2005-04-29  547  			if (ctx)
93315ed6dd12da Amy Griffis        2006-02-07  548  				result =3D audit_com=
parator(ctx->arch, f->op, f->val);
2fd6f58ba6efc8 David Woodhouse    2005-04-29  549  			break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  550  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  551  		case AUDIT_EXIT:
ba59eae7238572 Alex Shi           2020-11-06  552  			if (ctx && ctx->retur=
n_valid !=3D AUDITSC_INVALID)
93315ed6dd12da Amy Griffis        2006-02-07  553  				result =3D audit_com=
parator(ctx->return_code, f->op, f->val);
^1da177e4c3f41 Linus Torvalds     2005-04-16  554  			break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  555  		case AUDIT_SUCCESS:
ba59eae7238572 Alex Shi           2020-11-06  556  			if (ctx && ctx->retur=
n_valid !=3D AUDITSC_INVALID) {
93315ed6dd12da Amy Griffis        2006-02-07  557  				if (f->val)
93315ed6dd12da Amy Griffis        2006-02-07  558  					result =3D audit_co=
mparator(ctx->return_valid, f->op, AUDITSC_SUCCESS);
b01f2cc1c37ac3 David Woodhouse    2005-08-27  559  				else
93315ed6dd12da Amy Griffis        2006-02-07  560  					result =3D audit_co=
mparator(ctx->return_valid, f->op, AUDITSC_FAILURE);
b01f2cc1c37ac3 David Woodhouse    2005-08-27  561  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16  562  			break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  563  		case AUDIT_DEVMAJOR:
16c174bd95cb07 Eric Paris         2012-01-03  564  			if (name) {
16c174bd95cb07 Eric Paris         2012-01-03  565  				if (audit_comparator=
(MAJOR(name->dev), f->op, f->val) ||
16c174bd95cb07 Eric Paris         2012-01-03  566  				    audit_comparator=
(MAJOR(name->rdev), f->op, f->val))
16c174bd95cb07 Eric Paris         2012-01-03  567  					++result;
16c174bd95cb07 Eric Paris         2012-01-03  568  			} else if (ctx) {
5195d8e217a786 Eric Paris         2012-01-03  569  				list_for_each_entry(=
n, &ctx->names_list, list) {
16c174bd95cb07 Eric Paris         2012-01-03  570  					if (audit_comparato=
r(MAJOR(n->dev), f->op, f->val) ||
16c174bd95cb07 Eric Paris         2012-01-03  571  					    audit_comparato=
r(MAJOR(n->rdev), f->op, f->val)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  572  						++result;
^1da177e4c3f41 Linus Torvalds     2005-04-16  573  						break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  574  					}
^1da177e4c3f41 Linus Torvalds     2005-04-16  575  				}
^1da177e4c3f41 Linus Torvalds     2005-04-16  576  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16  577  			break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  578  		case AUDIT_DEVMINOR:
16c174bd95cb07 Eric Paris         2012-01-03  579  			if (name) {
16c174bd95cb07 Eric Paris         2012-01-03  580  				if (audit_comparator=
(MINOR(name->dev), f->op, f->val) ||
16c174bd95cb07 Eric Paris         2012-01-03  581  				    audit_comparator=
(MINOR(name->rdev), f->op, f->val))
16c174bd95cb07 Eric Paris         2012-01-03  582  					++result;
16c174bd95cb07 Eric Paris         2012-01-03  583  			} else if (ctx) {
5195d8e217a786 Eric Paris         2012-01-03  584  				list_for_each_entry(=
n, &ctx->names_list, list) {
16c174bd95cb07 Eric Paris         2012-01-03  585  					if (audit_comparato=
r(MINOR(n->dev), f->op, f->val) ||
16c174bd95cb07 Eric Paris         2012-01-03  586  					    audit_comparato=
r(MINOR(n->rdev), f->op, f->val)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  587  						++result;
^1da177e4c3f41 Linus Torvalds     2005-04-16  588  						break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  589  					}
^1da177e4c3f41 Linus Torvalds     2005-04-16  590  				}
^1da177e4c3f41 Linus Torvalds     2005-04-16  591  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16  592  			break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  593  		case AUDIT_INODE:
f368c07d7214a7 Amy Griffis        2006-04-07  594  			if (name)
db510fc5cd9b9d Richard Guy Briggs 2013-07-04  595  				result =3D audit_com=
parator(name->ino, f->op, f->val);
f368c07d7214a7 Amy Griffis        2006-04-07  596  			else if (ctx) {
5195d8e217a786 Eric Paris         2012-01-03  597  				list_for_each_entry(=
n, &ctx->names_list, list) {
5195d8e217a786 Eric Paris         2012-01-03  598  					if (audit_comparato=
r(n->ino, f->op, f->val)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  599  						++result;
^1da177e4c3f41 Linus Torvalds     2005-04-16  600  						break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  601  					}
^1da177e4c3f41 Linus Torvalds     2005-04-16  602  				}
^1da177e4c3f41 Linus Torvalds     2005-04-16  603  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16  604  			break;
efaffd6e441786 Eric Paris         2012-01-03  605  		case AUDIT_OBJ_UID:
efaffd6e441786 Eric Paris         2012-01-03  606  			if (name) {
ca57ec0f00c3f1 Eric W. Biederman  2012-09-11  607  				result =3D audit_uid=
_comparator(name->uid, f->op, f->uid);
efaffd6e441786 Eric Paris         2012-01-03  608  			} else if (ctx) {
efaffd6e441786 Eric Paris         2012-01-03  609  				list_for_each_entry(=
n, &ctx->names_list, list) {
ca57ec0f00c3f1 Eric W. Biederman  2012-09-11  610  					if (audit_uid_compa=
rator(n->uid, f->op, f->uid)) {
efaffd6e441786 Eric Paris         2012-01-03  611  						++result;
efaffd6e441786 Eric Paris         2012-01-03  612  						break;
efaffd6e441786 Eric Paris         2012-01-03  613  					}
efaffd6e441786 Eric Paris         2012-01-03  614  				}
efaffd6e441786 Eric Paris         2012-01-03  615  			}
efaffd6e441786 Eric Paris         2012-01-03  616  			break;
54d3218b31aee5 Eric Paris         2012-01-03  617  		case AUDIT_OBJ_GID:
54d3218b31aee5 Eric Paris         2012-01-03  618  			if (name) {
ca57ec0f00c3f1 Eric W. Biederman  2012-09-11  619  				result =3D audit_gid=
_comparator(name->gid, f->op, f->gid);
54d3218b31aee5 Eric Paris         2012-01-03  620  			} else if (ctx) {
54d3218b31aee5 Eric Paris         2012-01-03  621  				list_for_each_entry(=
n, &ctx->names_list, list) {
ca57ec0f00c3f1 Eric W. Biederman  2012-09-11  622  					if (audit_gid_compa=
rator(n->gid, f->op, f->gid)) {
54d3218b31aee5 Eric Paris         2012-01-03  623  						++result;
54d3218b31aee5 Eric Paris         2012-01-03  624  						break;
54d3218b31aee5 Eric Paris         2012-01-03  625  					}
54d3218b31aee5 Eric Paris         2012-01-03  626  				}
54d3218b31aee5 Eric Paris         2012-01-03  627  			}
54d3218b31aee5 Eric Paris         2012-01-03  628  			break;
f368c07d7214a7 Amy Griffis        2006-04-07  629  		case AUDIT_WATCH:
0223fad3c98a95 Richard Guy Briggs 2019-05-22  630  			if (name) {
0223fad3c98a95 Richard Guy Briggs 2019-05-22  631  				result =3D audit_wat=
ch_compare(rule->watch,
0223fad3c98a95 Richard Guy Briggs 2019-05-22  632  							     name->ino,
0223fad3c98a95 Richard Guy Briggs 2019-05-22  633  							     name->dev);
0223fad3c98a95 Richard Guy Briggs 2019-05-22  634  				if (f->op =3D=3D Aud=
it_not_equal)
0223fad3c98a95 Richard Guy Briggs 2019-05-22  635  					result =3D !result;
0223fad3c98a95 Richard Guy Briggs 2019-05-22  636  			}
f368c07d7214a7 Amy Griffis        2006-04-07  637  			break;
74c3cbe33bc077 Al Viro            2007-07-22  638  		case AUDIT_DIR:
0223fad3c98a95 Richard Guy Briggs 2019-05-22  639  			if (ctx) {
74c3cbe33bc077 Al Viro            2007-07-22  640  				result =3D match_tre=
e_refs(ctx, rule->tree);
0223fad3c98a95 Richard Guy Briggs 2019-05-22  641  				if (f->op =3D=3D Aud=
it_not_equal)
0223fad3c98a95 Richard Guy Briggs 2019-05-22  642  					result =3D !result;
0223fad3c98a95 Richard Guy Briggs 2019-05-22  643  			}
74c3cbe33bc077 Al Viro            2007-07-22  644  			break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  645  		case AUDIT_LOGINUID:
38f80590486e38 Richard Guy Briggs 2018-05-16  646  			result =3D audit_uid_=
comparator(audit_get_loginuid(tsk),
38f80590486e38 Richard Guy Briggs 2018-05-16  647  						      f->op, f->ui=
d);
^1da177e4c3f41 Linus Torvalds     2005-04-16  648  			break;
780a7654cee8d6 Eric W. Biederman  2013-04-09  649  		case AUDIT_LOGINUID_SE=
T:
780a7654cee8d6 Eric W. Biederman  2013-04-09  650  			result =3D audit_comp=
arator(audit_loginuid_set(tsk), f->op, f->val);
780a7654cee8d6 Eric W. Biederman  2013-04-09  651  			break;
bf361231c295d9 Richard Guy Briggs 2019-05-09  652  		case AUDIT_SADDR_FAM:
bf361231c295d9 Richard Guy Briggs 2019-05-09 @653  			if (ctx->sockaddr)
bf361231c295d9 Richard Guy Briggs 2019-05-09  654  				result =3D audit_com=
parator(ctx->sockaddr->ss_family,
bf361231c295d9 Richard Guy Briggs 2019-05-09  655  							  f->op, f->val);
bf361231c295d9 Richard Guy Briggs 2019-05-09  656  			break;
3a6b9f85c641a3 Darrel Goeddel     2006-06-29  657  		case AUDIT_SUBJ_USER:
3a6b9f85c641a3 Darrel Goeddel     2006-06-29  658  		case AUDIT_SUBJ_ROLE:
3a6b9f85c641a3 Darrel Goeddel     2006-06-29  659  		case AUDIT_SUBJ_TYPE:
3a6b9f85c641a3 Darrel Goeddel     2006-06-29  660  		case AUDIT_SUBJ_SEN:
3a6b9f85c641a3 Darrel Goeddel     2006-06-29  661  		case AUDIT_SUBJ_CLR:
3dc7e3153eddfc Darrel Goeddel     2006-03-10  662  			/* NOTE: this may ret=
urn negative values indicating
3dc7e3153eddfc Darrel Goeddel     2006-03-10  663  			   a temporary error.=
  We simply treat this as a
3dc7e3153eddfc Darrel Goeddel     2006-03-10  664  			   match for now to a=
void losing information that
3dc7e3153eddfc Darrel Goeddel     2006-03-10  665  			   may be wanted.   A=
n error message will also be
3dc7e3153eddfc Darrel Goeddel     2006-03-10  666  			   logged upon error =
*/
04305e4aff8b05 Ahmed S. Darwish   2008-04-19  667  			if (f->lsm_rule) {
2ad312d2093ae5 Steve Grubb        2006-04-11  668  				if (need_sid) {
4ebd7651bfc899 Paul Moore         2021-02-19  669  					security_task_getse=
cid_subj(tsk, &sid);
2ad312d2093ae5 Steve Grubb        2006-04-11  670  					need_sid =3D 0;
2ad312d2093ae5 Steve Grubb        2006-04-11  671  				}
d7a96f3a1ae279 Ahmed S. Darwish   2008-03-01  672  				result =3D security_=
audit_rule_match(sid, f->type,
3dc7e3153eddfc Darrel Goeddel     2006-03-10  673  								   f->op,
90462a5bd30c6e Richard Guy Briggs 2019-01-31  674  								   f->lsm_rule);
2ad312d2093ae5 Steve Grubb        2006-04-11  675  			}
3dc7e3153eddfc Darrel Goeddel     2006-03-10  676  			break;
6e5a2d1d325968 Darrel Goeddel     2006-06-29  677  		case AUDIT_OBJ_USER:
6e5a2d1d325968 Darrel Goeddel     2006-06-29  678  		case AUDIT_OBJ_ROLE:
6e5a2d1d325968 Darrel Goeddel     2006-06-29  679  		case AUDIT_OBJ_TYPE:
6e5a2d1d325968 Darrel Goeddel     2006-06-29  680  		case AUDIT_OBJ_LEV_LOW:
6e5a2d1d325968 Darrel Goeddel     2006-06-29  681  		case AUDIT_OBJ_LEV_HIG=
H:
6e5a2d1d325968 Darrel Goeddel     2006-06-29  682  			/* The above note for=
 AUDIT_SUBJ_USER...AUDIT_SUBJ_CLR
6e5a2d1d325968 Darrel Goeddel     2006-06-29  683  			   also applies here =
*/
04305e4aff8b05 Ahmed S. Darwish   2008-04-19  684  			if (f->lsm_rule) {
6e5a2d1d325968 Darrel Goeddel     2006-06-29  685  				/* Find files that m=
atch */
6e5a2d1d325968 Darrel Goeddel     2006-06-29  686  				if (name) {
d7a96f3a1ae279 Ahmed S. Darwish   2008-03-01  687  					result =3D security=
_audit_rule_match(
90462a5bd30c6e Richard Guy Briggs 2019-01-31  688  								name->osid,
90462a5bd30c6e Richard Guy Briggs 2019-01-31  689  								f->type,
90462a5bd30c6e Richard Guy Briggs 2019-01-31  690  								f->op,
90462a5bd30c6e Richard Guy Briggs 2019-01-31  691  								f->lsm_rule);
6e5a2d1d325968 Darrel Goeddel     2006-06-29  692  				} else if (ctx) {
5195d8e217a786 Eric Paris         2012-01-03  693  					list_for_each_entry=
(n, &ctx->names_list, list) {
90462a5bd30c6e Richard Guy Briggs 2019-01-31  694  						if (security_audit=
_rule_match(
90462a5bd30c6e Richard Guy Briggs 2019-01-31  695  								n->osid,
90462a5bd30c6e Richard Guy Briggs 2019-01-31  696  								f->type,
90462a5bd30c6e Richard Guy Briggs 2019-01-31  697  								f->op,
90462a5bd30c6e Richard Guy Briggs 2019-01-31  698  								f->lsm_rule)) {
6e5a2d1d325968 Darrel Goeddel     2006-06-29  699  							++result;
6e5a2d1d325968 Darrel Goeddel     2006-06-29  700  							break;
6e5a2d1d325968 Darrel Goeddel     2006-06-29  701  						}
6e5a2d1d325968 Darrel Goeddel     2006-06-29  702  					}
6e5a2d1d325968 Darrel Goeddel     2006-06-29  703  				}
6e5a2d1d325968 Darrel Goeddel     2006-06-29  704  				/* Find ipc objects =
that match */
a33e6751003c5a Al Viro            2008-12-10  705  				if (!ctx || ctx->typ=
e !=3D AUDIT_IPC)
6e5a2d1d325968 Darrel Goeddel     2006-06-29  706  					break;
a33e6751003c5a Al Viro            2008-12-10  707  				if (security_audit_r=
ule_match(ctx->ipc.osid,
a33e6751003c5a Al Viro            2008-12-10  708  							      f->type, f-=
>op,
90462a5bd30c6e Richard Guy Briggs 2019-01-31  709  							      f->lsm_rule=
))
a33e6751003c5a Al Viro            2008-12-10  710  					++result;
6e5a2d1d325968 Darrel Goeddel     2006-06-29  711  			}
6e5a2d1d325968 Darrel Goeddel     2006-06-29  712  			break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  713  		case AUDIT_ARG0:
^1da177e4c3f41 Linus Torvalds     2005-04-16  714  		case AUDIT_ARG1:
^1da177e4c3f41 Linus Torvalds     2005-04-16  715  		case AUDIT_ARG2:
^1da177e4c3f41 Linus Torvalds     2005-04-16  716  		case AUDIT_ARG3:
^1da177e4c3f41 Linus Torvalds     2005-04-16  717  			if (ctx)
93315ed6dd12da Amy Griffis        2006-02-07  718  				result =3D audit_com=
parator(ctx->argv[f->type-AUDIT_ARG0], f->op, f->val);
^1da177e4c3f41 Linus Torvalds     2005-04-16  719  			break;
5adc8a6adc91c4 Amy Griffis        2006-06-14  720  		case AUDIT_FILTERKEY:
5adc8a6adc91c4 Amy Griffis        2006-06-14  721  			/* ignore this field =
for filtering */
5adc8a6adc91c4 Amy Griffis        2006-06-14  722  			result =3D 1;
5adc8a6adc91c4 Amy Griffis        2006-06-14  723  			break;
55669bfa141b48 Al Viro            2006-08-31  724  		case AUDIT_PERM:
55669bfa141b48 Al Viro            2006-08-31  725  			result =3D audit_matc=
h_perm(ctx, f->val);
0223fad3c98a95 Richard Guy Briggs 2019-05-22  726  			if (f->op =3D=3D Audi=
t_not_equal)
0223fad3c98a95 Richard Guy Briggs 2019-05-22  727  				result =3D !result;
55669bfa141b48 Al Viro            2006-08-31  728  			break;
8b67dca9420474 Al Viro            2008-04-28  729  		case AUDIT_FILETYPE:
8b67dca9420474 Al Viro            2008-04-28  730  			result =3D audit_matc=
h_filetype(ctx, f->val);
0223fad3c98a95 Richard Guy Briggs 2019-05-22  731  			if (f->op =3D=3D Audi=
t_not_equal)
0223fad3c98a95 Richard Guy Briggs 2019-05-22  732  				result =3D !result;
8b67dca9420474 Al Viro            2008-04-28  733  			break;
02d86a568c6d2d Eric Paris         2012-01-03  734  		case AUDIT_FIELD_COMPA=
RE:
02d86a568c6d2d Eric Paris         2012-01-03  735  			result =3D audit_fiel=
d_compare(tsk, cred, f, ctx, name);
02d86a568c6d2d Eric Paris         2012-01-03  736  			break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  737  		}
f562988350361b Tony Jones         2011-04-27  738  		if (!result)
^1da177e4c3f41 Linus Torvalds     2005-04-16  739  			return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  740  	}
0590b9335a1c72 Al Viro            2008-12-14  741  =

0590b9335a1c72 Al Viro            2008-12-14  742  	if (ctx) {
0590b9335a1c72 Al Viro            2008-12-14  743  		if (rule->filterkey) {
0590b9335a1c72 Al Viro            2008-12-14  744  			kfree(ctx->filterkey);
5adc8a6adc91c4 Amy Griffis        2006-06-14  745  			ctx->filterkey =3D ks=
trdup(rule->filterkey, GFP_ATOMIC);
0590b9335a1c72 Al Viro            2008-12-14  746  		}
0590b9335a1c72 Al Viro            2008-12-14  747  		ctx->prio =3D rule->pr=
io;
0590b9335a1c72 Al Viro            2008-12-14  748  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  749  	switch (rule->action) {
66b12abc846d31 Paul Moore         2016-06-16  750  	case AUDIT_NEVER:
619ed58ac4e2fb Sergey Nazarov     2021-06-08  751  		*state =3D AUDIT_STATE=
_DISABLED;
66b12abc846d31 Paul Moore         2016-06-16  752  		break;
66b12abc846d31 Paul Moore         2016-06-16  753  	case AUDIT_ALWAYS:
619ed58ac4e2fb Sergey Nazarov     2021-06-08  754  		*state =3D AUDIT_STATE=
_RECORD;
66b12abc846d31 Paul Moore         2016-06-16  755  		break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  756  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  757  	return 1;
^1da177e4c3f41 Linus Torvalds     2005-04-16  758  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  759  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6827659621783554668==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
0kx2uQEA
--===============6827659621783554668==--

