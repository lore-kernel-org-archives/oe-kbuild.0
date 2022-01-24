Content-Type: multipart/mixed; boundary="===============5797363699882133098=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/trace/trace_events_hist.c:6174 event_hist_trigger_parse() error: we previously assumed 'glob' could be null (see line 6166)
Date: Tue, 25 Jan 2022 00:54:39 +0800
Message-ID: <202201250054.975KVd1O-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5797363699882133098==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Tom Zanussi <zanussi@kernel.org>
CC: Steven Rostedt <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   dd81e1c7d5fb126e5fbc5c9e334d7b3ec29a16a0
commit: 9ec5a7d16899ed9062cc4c3dd3a13e1771411ab3 tracing: Change event_comm=
and func() to parse()
date:   2 weeks ago
:::::: branch date: 25 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-m001-20220124 (https://download.01.org/0day-ci/ar=
chive/20220125/202201250054.975KVd1O-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/trace/trace_events_hist.c:6174 event_hist_trigger_parse() error: we =
previously assumed 'glob' could be null (see line 6166)

vim +/glob +6174 kernel/trace/trace_events_hist.c

52a7f16dedff8f Tom Zanussi             2016-03-03  6148  =

9ec5a7d16899ed Tom Zanussi             2022-01-10  6149  static int event_h=
ist_trigger_parse(struct event_command *cmd_ops,
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6150  				    struct tra=
ce_event_file *file,
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6151  				    char *glob=
, char *cmd, char *param)
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6152  {
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6153  	unsigned int hist=
_trigger_bits =3D TRACING_MAP_BITS_DEFAULT;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6154  	struct event_trig=
ger_data *trigger_data;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6155  	struct hist_trigg=
er_attrs *attrs;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6156  	struct event_trig=
ger_ops *trigger_ops;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6157  	struct hist_trigg=
er_data *hist_data;
4b147936fa5096 Tom Zanussi             2018-01-15  6158  	struct synth_even=
t *se;
4b147936fa5096 Tom Zanussi             2018-01-15  6159  	const char *se_na=
me;
30350d65ac5676 Tom Zanussi             2018-01-15  6160  	bool remove =3D f=
alse;
c5eac6ee8bc5d3 Kalesh Singh            2021-10-25  6161  	char *trigger, *p=
, *start;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6162  	int ret =3D 0;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6163  =

0e2b81f7b52a1c Masami Hiramatsu        2018-11-05  6164  	lockdep_assert_he=
ld(&event_mutex);
0e2b81f7b52a1c Masami Hiramatsu        2018-11-05  6165  =

f404da6e1d46ce Tom Zanussi             2018-01-15 @6166  	if (glob && strle=
n(glob)) {
f404da6e1d46ce Tom Zanussi             2018-01-15  6167  		hist_err_clear();
a1a05bb40e229d Tom Zanussi             2019-03-31  6168  		last_cmd_set(fil=
e, param);
f404da6e1d46ce Tom Zanussi             2018-01-15  6169  	}
f404da6e1d46ce Tom Zanussi             2018-01-15  6170  =

7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6171  	if (!param)
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6172  		return -EINVAL;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6173  =

30350d65ac5676 Tom Zanussi             2018-01-15 @6174  	if (glob[0] =3D=
=3D '!')
30350d65ac5676 Tom Zanussi             2018-01-15  6175  		remove =3D true;
30350d65ac5676 Tom Zanussi             2018-01-15  6176  =

ec5ce098754108 Tom Zanussi             2018-01-15  6177  	/*
ec5ce098754108 Tom Zanussi             2018-01-15  6178  	 * separate the t=
rigger from the filter (k:v [if filter])
ec5ce098754108 Tom Zanussi             2018-01-15  6179  	 * allowing for w=
hitespace in the trigger
ec5ce098754108 Tom Zanussi             2018-01-15  6180  	 */
ec5ce098754108 Tom Zanussi             2018-01-15  6181  	p =3D trigger =3D=
 param;
ec5ce098754108 Tom Zanussi             2018-01-15  6182  	do {
ec5ce098754108 Tom Zanussi             2018-01-15  6183  		p =3D strstr(p, =
"if");
ec5ce098754108 Tom Zanussi             2018-01-15  6184  		if (!p)
ec5ce098754108 Tom Zanussi             2018-01-15  6185  			break;
ec5ce098754108 Tom Zanussi             2018-01-15  6186  		if (p =3D=3D par=
am)
ec5ce098754108 Tom Zanussi             2018-01-15  6187  			return -EINVAL;
ec5ce098754108 Tom Zanussi             2018-01-15  6188  		if (*(p - 1) !=
=3D ' ' && *(p - 1) !=3D '\t') {
ec5ce098754108 Tom Zanussi             2018-01-15  6189  			p++;
ec5ce098754108 Tom Zanussi             2018-01-15  6190  			continue;
ec5ce098754108 Tom Zanussi             2018-01-15  6191  		}
2f31ed9308cc9e Tom Zanussi             2018-12-18  6192  		if (p >=3D param=
 + strlen(param) - (sizeof("if") - 1) - 1)
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6193  			return -EINVAL;
2f31ed9308cc9e Tom Zanussi             2018-12-18  6194  		if (*(p + sizeof=
("if") - 1) !=3D ' ' && *(p + sizeof("if") - 1) !=3D '\t') {
ec5ce098754108 Tom Zanussi             2018-01-15  6195  			p++;
ec5ce098754108 Tom Zanussi             2018-01-15  6196  			continue;
ec5ce098754108 Tom Zanussi             2018-01-15  6197  		}
ec5ce098754108 Tom Zanussi             2018-01-15  6198  		break;
ec5ce098754108 Tom Zanussi             2018-01-15  6199  	} while (p);
ec5ce098754108 Tom Zanussi             2018-01-15  6200  =

ec5ce098754108 Tom Zanussi             2018-01-15  6201  	if (!p)
ec5ce098754108 Tom Zanussi             2018-01-15  6202  		param =3D NULL;
ec5ce098754108 Tom Zanussi             2018-01-15  6203  	else {
ec5ce098754108 Tom Zanussi             2018-01-15  6204  		*(p - 1) =3D '\0=
';
ec5ce098754108 Tom Zanussi             2018-01-15  6205  		param =3D strstr=
ip(p);
ec5ce098754108 Tom Zanussi             2018-01-15  6206  		trigger =3D strs=
trip(trigger);
ec5ce098754108 Tom Zanussi             2018-01-15  6207  	}
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6208  =

c5eac6ee8bc5d3 Kalesh Singh            2021-10-25  6209  	/*
c5eac6ee8bc5d3 Kalesh Singh            2021-10-25  6210  	 * To simplify ar=
ithmetic expression parsing, replace occurrences of
c5eac6ee8bc5d3 Kalesh Singh            2021-10-25  6211  	 * '.sym-offset' =
modifier with '.symXoffset'
c5eac6ee8bc5d3 Kalesh Singh            2021-10-25  6212  	 */
c5eac6ee8bc5d3 Kalesh Singh            2021-10-25  6213  	start =3D strstr(=
trigger, ".sym-offset");
c5eac6ee8bc5d3 Kalesh Singh            2021-10-25  6214  	while (start) {
c5eac6ee8bc5d3 Kalesh Singh            2021-10-25  6215  		*(start + 4) =3D=
 'X';
c5eac6ee8bc5d3 Kalesh Singh            2021-10-25  6216  		start =3D strstr=
(start + 11, ".sym-offset");
feea69ec121f06 kernel test robot       2021-10-30  6217  	}
c5eac6ee8bc5d3 Kalesh Singh            2021-10-25  6218  =

d0cd871ba0d613 Steven Rostedt (VMware  2019-04-01  6219) 	attrs =3D parse_h=
ist_trigger_attrs(file->tr, trigger);
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6220  	if (IS_ERR(attrs))
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6221  		return PTR_ERR(a=
ttrs);
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6222  =

7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6223  	if (attrs->map_bi=
ts)
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6224  		hist_trigger_bit=
s =3D attrs->map_bits;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6225  =

30350d65ac5676 Tom Zanussi             2018-01-15  6226  	hist_data =3D cre=
ate_hist_data(hist_trigger_bits, attrs, file, remove);
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6227  	if (IS_ERR(hist_d=
ata)) {
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6228  		destroy_hist_tri=
gger_attrs(attrs);
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6229  		return PTR_ERR(h=
ist_data);
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6230  	}
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6231  =

7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6232  	trigger_ops =3D c=
md_ops->get_trigger_ops(cmd, trigger);
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6233  =

7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6234  	trigger_data =3D =
kzalloc(sizeof(*trigger_data), GFP_KERNEL);
4b147936fa5096 Tom Zanussi             2018-01-15  6235  	if (!trigger_data=
) {
4b147936fa5096 Tom Zanussi             2018-01-15  6236  		ret =3D -ENOMEM;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6237  		goto out_free;
4b147936fa5096 Tom Zanussi             2018-01-15  6238  	}
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6239  =

7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6240  	trigger_data->cou=
nt =3D -1;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6241  	trigger_data->ops=
 =3D trigger_ops;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6242  	trigger_data->cmd=
_ops =3D cmd_ops;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6243  =

7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6244  	INIT_LIST_HEAD(&t=
rigger_data->list);
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6245  	RCU_INIT_POINTER(=
trigger_data->filter, NULL);
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6246  =

7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6247  	trigger_data->pri=
vate_data =3D hist_data;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6248  =

52a7f16dedff8f Tom Zanussi             2016-03-03  6249  	/* if param is no=
n-empty, it's supposed to be a filter */
52a7f16dedff8f Tom Zanussi             2016-03-03  6250  	if (param && cmd_=
ops->set_filter) {
52a7f16dedff8f Tom Zanussi             2016-03-03  6251  		ret =3D cmd_ops-=
>set_filter(param, trigger_data, file);
52a7f16dedff8f Tom Zanussi             2016-03-03  6252  		if (ret < 0)
52a7f16dedff8f Tom Zanussi             2016-03-03  6253  			goto out_free;
52a7f16dedff8f Tom Zanussi             2016-03-03  6254  	}
52a7f16dedff8f Tom Zanussi             2016-03-03  6255  =

30350d65ac5676 Tom Zanussi             2018-01-15  6256  	if (remove) {
4b147936fa5096 Tom Zanussi             2018-01-15  6257  		if (!have_hist_t=
rigger_match(trigger_data, file))
4b147936fa5096 Tom Zanussi             2018-01-15  6258  			goto out_free;
4b147936fa5096 Tom Zanussi             2018-01-15  6259  =

067fe038e70f6e Tom Zanussi             2018-01-15  6260  		if (hist_trigger=
_check_refs(trigger_data, file)) {
067fe038e70f6e Tom Zanussi             2018-01-15  6261  			ret =3D -EBUSY;
067fe038e70f6e Tom Zanussi             2018-01-15  6262  			goto out_free;
067fe038e70f6e Tom Zanussi             2018-01-15  6263  		}
067fe038e70f6e Tom Zanussi             2018-01-15  6264  =

7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6265  		cmd_ops->unreg(g=
lob+1, trigger_ops, trigger_data, file);
4b147936fa5096 Tom Zanussi             2018-01-15  6266  		se_name =3D trac=
e_event_name(file->event_call);
4b147936fa5096 Tom Zanussi             2018-01-15  6267  		se =3D find_synt=
h_event(se_name);
4b147936fa5096 Tom Zanussi             2018-01-15  6268  		if (se)
4b147936fa5096 Tom Zanussi             2018-01-15  6269  			se->ref--;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6270  		ret =3D 0;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6271  		goto out_free;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6272  	}
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6273  =

7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6274  	ret =3D cmd_ops->=
reg(glob, trigger_ops, trigger_data, file);
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6275  	/*
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6276  	 * The above retu=
rns on success the # of triggers registered,
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6277  	 * but if it didn=
't register any it returns zero.  Consider no
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6278  	 * triggers regis=
tered a failure too.
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6279  	 */
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6280  	if (!ret) {
e86ae9baacfa9e Tom Zanussi             2016-03-03  6281  		if (!(attrs->pau=
se || attrs->cont || attrs->clear))
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6282  			ret =3D -ENOENT;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6283  		goto out_free;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6284  	} else if (ret < =
0)
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6285  		goto out_free;
067fe038e70f6e Tom Zanussi             2018-01-15  6286  =

067fe038e70f6e Tom Zanussi             2018-01-15  6287  	if (get_named_tri=
gger_data(trigger_data))
067fe038e70f6e Tom Zanussi             2018-01-15  6288  		goto enable;
067fe038e70f6e Tom Zanussi             2018-01-15  6289  =

067fe038e70f6e Tom Zanussi             2018-01-15  6290  	if (has_hist_vars=
(hist_data))
067fe038e70f6e Tom Zanussi             2018-01-15  6291  		save_hist_vars(h=
ist_data);
067fe038e70f6e Tom Zanussi             2018-01-15  6292  =

7d18a10c316783 Tom Zanussi             2019-02-13  6293  	ret =3D create_ac=
tions(hist_data);
0212e2aa30e112 Tom Zanussi             2018-01-15  6294  	if (ret)
0212e2aa30e112 Tom Zanussi             2018-01-15  6295  		goto out_unreg;
0212e2aa30e112 Tom Zanussi             2018-01-15  6296  =

067fe038e70f6e Tom Zanussi             2018-01-15  6297  	ret =3D tracing_m=
ap_init(hist_data->map);
067fe038e70f6e Tom Zanussi             2018-01-15  6298  	if (ret)
067fe038e70f6e Tom Zanussi             2018-01-15  6299  		goto out_unreg;
067fe038e70f6e Tom Zanussi             2018-01-15  6300  enable:
067fe038e70f6e Tom Zanussi             2018-01-15  6301  	ret =3D hist_trig=
ger_enable(trigger_data, file);
067fe038e70f6e Tom Zanussi             2018-01-15  6302  	if (ret)
067fe038e70f6e Tom Zanussi             2018-01-15  6303  		goto out_unreg;
067fe038e70f6e Tom Zanussi             2018-01-15  6304  =

4b147936fa5096 Tom Zanussi             2018-01-15  6305  	se_name =3D trace=
_event_name(file->event_call);
4b147936fa5096 Tom Zanussi             2018-01-15  6306  	se =3D find_synth=
_event(se_name);
4b147936fa5096 Tom Zanussi             2018-01-15  6307  	if (se)
4b147936fa5096 Tom Zanussi             2018-01-15  6308  		se->ref++;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6309  	/* Just return ze=
ro, not the number of registered triggers */
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6310  	ret =3D 0;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6311   out:
f404da6e1d46ce Tom Zanussi             2018-01-15  6312  	if (ret =3D=3D 0)
f404da6e1d46ce Tom Zanussi             2018-01-15  6313  		hist_err_clear();
f404da6e1d46ce Tom Zanussi             2018-01-15  6314  =

7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6315  	return ret;
067fe038e70f6e Tom Zanussi             2018-01-15  6316   out_unreg:
067fe038e70f6e Tom Zanussi             2018-01-15  6317  	cmd_ops->unreg(gl=
ob+1, trigger_ops, trigger_data, file);
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6318   out_free:
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6319  	if (cmd_ops->set_=
filter)
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6320  		cmd_ops->set_fil=
ter(NULL, trigger_data, NULL);
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6321  =

067fe038e70f6e Tom Zanussi             2018-01-15  6322  	remove_hist_vars(=
hist_data);
067fe038e70f6e Tom Zanussi             2018-01-15  6323  =

7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6324  	kfree(trigger_dat=
a);
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6325  =

7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6326  	destroy_hist_data=
(hist_data);
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6327  	goto out;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6328  }
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6329  =


:::::: The code at line 6174 was first introduced by commit
:::::: 30350d65ac5676c6d08d4fc935bc9a9cb0fd4ed3 tracing: Add variable suppo=
rt to hist triggers

:::::: TO: Tom Zanussi <tom.zanussi@linux.intel.com>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5797363699882133098==--

