Content-Type: multipart/mixed; boundary="===============1993867650040390698=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [zanussi-trace:ftrace/cleanup-hist-func-v4 4/4] kernel/trace/trace_events_hist.c:6253 event_hist_trigger_parse() error: uninitialized symbol 'trigger_ops'.
Date: Sat, 11 Dec 2021 11:06:54 +0800
Message-ID: <202112111115.9jj2W3pF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1993867650040390698==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Tom Zanussi <zanussi@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/zanussi/linux-trace=
.git ftrace/cleanup-hist-func-v4
head:   c62ecf84dee35ff23b14ae3db0bb0006c35caff7
commit: c62ecf84dee35ff23b14ae3db0bb0006c35caff7 [4/4] tracing: Have existi=
ng event_command.parse() implementations use helpers
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: i386-randconfig-m021-20211210 (https://download.01.org/0day-ci/arch=
ive/20211211/202112111115.9jj2W3pF-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/trace/trace_events_hist.c:6253 event_hist_trigger_parse() error: uni=
nitialized symbol 'trigger_ops'.

vim +/trigger_ops +6253 kernel/trace/trace_events_hist.c

52a7f16dedff8f Tom Zanussi       2016-03-03  6149  =

7784e321840752 Tom Zanussi       2021-12-09  6150  static int event_hist_tr=
igger_parse(struct event_command *cmd_ops,
7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6151  				    struct trace_eve=
nt_file *file,
c62ecf84dee35f Tom Zanussi       2021-11-05  6152  				    char *glob, char=
 *cmd,
c62ecf84dee35f Tom Zanussi       2021-11-05  6153  				    char *param_and_=
filter)
7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6154  {
7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6155  	unsigned int hist_trigg=
er_bits =3D TRACING_MAP_BITS_DEFAULT;
7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6156  	struct event_trigger_da=
ta *trigger_data;
7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6157  	struct hist_trigger_att=
rs *attrs;
7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6158  	struct event_trigger_op=
s *trigger_ops;
7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6159  	struct hist_trigger_dat=
a *hist_data;
c62ecf84dee35f Tom Zanussi       2021-11-05  6160  	char *param, *filter, *=
p, *start;
4b147936fa5096 Tom Zanussi       2018-01-15  6161  	struct synth_event *se;
4b147936fa5096 Tom Zanussi       2018-01-15  6162  	const char *se_name;
c62ecf84dee35f Tom Zanussi       2021-11-05  6163  	int n_registered;
c62ecf84dee35f Tom Zanussi       2021-11-05  6164  	bool remove;
7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6165  	int ret =3D 0;
7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6166  =

0e2b81f7b52a1c Masami Hiramatsu  2018-11-05  6167  	lockdep_assert_held(&ev=
ent_mutex);
0e2b81f7b52a1c Masami Hiramatsu  2018-11-05  6168  =

f404da6e1d46ce Tom Zanussi       2018-01-15  6169  	if (glob && strlen(glob=
)) {
f404da6e1d46ce Tom Zanussi       2018-01-15  6170  		hist_err_clear();
c62ecf84dee35f Tom Zanussi       2021-11-05  6171  		last_cmd_set(file, par=
am_and_filter);
f404da6e1d46ce Tom Zanussi       2018-01-15  6172  	}
f404da6e1d46ce Tom Zanussi       2018-01-15  6173  =

c62ecf84dee35f Tom Zanussi       2021-11-05  6174  	remove =3D event_trigge=
r_check_remove(glob);
7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6175  =

c62ecf84dee35f Tom Zanussi       2021-11-05  6176  	if (event_trigger_empty=
_param(param_and_filter))
c62ecf84dee35f Tom Zanussi       2021-11-05  6177  		return -EINVAL;
30350d65ac5676 Tom Zanussi       2018-01-15  6178  =

ec5ce098754108 Tom Zanussi       2018-01-15  6179  	/*
ec5ce098754108 Tom Zanussi       2018-01-15  6180  	 * separate the trigger=
 from the filter (k:v [if filter])
ec5ce098754108 Tom Zanussi       2018-01-15  6181  	 * allowing for whitesp=
ace in the trigger
ec5ce098754108 Tom Zanussi       2018-01-15  6182  	 */
c62ecf84dee35f Tom Zanussi       2021-11-05  6183  	p =3D param =3D param_a=
nd_filter;
ec5ce098754108 Tom Zanussi       2018-01-15  6184  	do {
ec5ce098754108 Tom Zanussi       2018-01-15  6185  		p =3D strstr(p, "if");
ec5ce098754108 Tom Zanussi       2018-01-15  6186  		if (!p)
ec5ce098754108 Tom Zanussi       2018-01-15  6187  			break;
c62ecf84dee35f Tom Zanussi       2021-11-05  6188  		if (p =3D=3D param_and=
_filter)
ec5ce098754108 Tom Zanussi       2018-01-15  6189  			return -EINVAL;
ec5ce098754108 Tom Zanussi       2018-01-15  6190  		if (*(p - 1) !=3D ' ' =
&& *(p - 1) !=3D '\t') {
ec5ce098754108 Tom Zanussi       2018-01-15  6191  			p++;
ec5ce098754108 Tom Zanussi       2018-01-15  6192  			continue;
ec5ce098754108 Tom Zanussi       2018-01-15  6193  		}
c62ecf84dee35f Tom Zanussi       2021-11-05  6194  		if (p >=3D param_and_f=
ilter + strlen(param_and_filter) - (sizeof("if") - 1) - 1)
7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6195  			return -EINVAL;
2f31ed9308cc9e Tom Zanussi       2018-12-18  6196  		if (*(p + sizeof("if")=
 - 1) !=3D ' ' && *(p + sizeof("if") - 1) !=3D '\t') {
ec5ce098754108 Tom Zanussi       2018-01-15  6197  			p++;
ec5ce098754108 Tom Zanussi       2018-01-15  6198  			continue;
ec5ce098754108 Tom Zanussi       2018-01-15  6199  		}
ec5ce098754108 Tom Zanussi       2018-01-15  6200  		break;
ec5ce098754108 Tom Zanussi       2018-01-15  6201  	} while (p);
ec5ce098754108 Tom Zanussi       2018-01-15  6202  =

ec5ce098754108 Tom Zanussi       2018-01-15  6203  	if (!p)
c62ecf84dee35f Tom Zanussi       2021-11-05  6204  		filter =3D NULL;
ec5ce098754108 Tom Zanussi       2018-01-15  6205  	else {
ec5ce098754108 Tom Zanussi       2018-01-15  6206  		*(p - 1) =3D '\0';
c62ecf84dee35f Tom Zanussi       2021-11-05  6207  		filter =3D strstrip(p);
c62ecf84dee35f Tom Zanussi       2021-11-05  6208  		param =3D strstrip(par=
am);
ec5ce098754108 Tom Zanussi       2018-01-15  6209  	}
7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6210  =

c5eac6ee8bc5d3 Kalesh Singh      2021-10-25  6211  	/*
c5eac6ee8bc5d3 Kalesh Singh      2021-10-25  6212  	 * To simplify arithmet=
ic expression parsing, replace occurrences of
c5eac6ee8bc5d3 Kalesh Singh      2021-10-25  6213  	 * '.sym-offset' modifi=
er with '.symXoffset'
c5eac6ee8bc5d3 Kalesh Singh      2021-10-25  6214  	 */
c62ecf84dee35f Tom Zanussi       2021-11-05  6215  	start =3D strstr(param,=
 ".sym-offset");
c5eac6ee8bc5d3 Kalesh Singh      2021-10-25  6216  	while (start) {
c5eac6ee8bc5d3 Kalesh Singh      2021-10-25  6217  		*(start + 4) =3D 'X';
c5eac6ee8bc5d3 Kalesh Singh      2021-10-25  6218  		start =3D strstr(start=
 + 11, ".sym-offset");
feea69ec121f06 kernel test robot 2021-10-30  6219  	}
c5eac6ee8bc5d3 Kalesh Singh      2021-10-25  6220  =

c62ecf84dee35f Tom Zanussi       2021-11-05  6221  	attrs =3D parse_hist_tr=
igger_attrs(file->tr, param);
7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6222  	if (IS_ERR(attrs))
7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6223  		return PTR_ERR(attrs);
7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6224  =

7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6225  	if (attrs->map_bits)
7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6226  		hist_trigger_bits =3D =
attrs->map_bits;
7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6227  =

30350d65ac5676 Tom Zanussi       2018-01-15  6228  	hist_data =3D create_hi=
st_data(hist_trigger_bits, attrs, file, remove);
7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6229  	if (IS_ERR(hist_data)) {
7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6230  		destroy_hist_trigger_a=
ttrs(attrs);
7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6231  		return PTR_ERR(hist_da=
ta);
7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6232  	}
7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6233  =

c62ecf84dee35f Tom Zanussi       2021-11-05  6234  	trigger_data =3D event_=
trigger_alloc(cmd_ops, cmd, param, hist_data);
4b147936fa5096 Tom Zanussi       2018-01-15  6235  	if (!trigger_data) {
4b147936fa5096 Tom Zanussi       2018-01-15  6236  		ret =3D -ENOMEM;
7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6237  		goto out_free;
4b147936fa5096 Tom Zanussi       2018-01-15  6238  	}
7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6239  =

c62ecf84dee35f Tom Zanussi       2021-11-05  6240  	ret =3D event_trigger_s=
et_filter(cmd_ops, file, filter, trigger_data);
52a7f16dedff8f Tom Zanussi       2016-03-03  6241  	if (ret < 0)
52a7f16dedff8f Tom Zanussi       2016-03-03  6242  		goto out_free;
52a7f16dedff8f Tom Zanussi       2016-03-03  6243  =

30350d65ac5676 Tom Zanussi       2018-01-15  6244  	if (remove) {
4b147936fa5096 Tom Zanussi       2018-01-15  6245  		if (!have_hist_trigger=
_match(trigger_data, file))
4b147936fa5096 Tom Zanussi       2018-01-15  6246  			goto out_free;
4b147936fa5096 Tom Zanussi       2018-01-15  6247  =

067fe038e70f6e Tom Zanussi       2018-01-15  6248  		if (hist_trigger_check=
_refs(trigger_data, file)) {
067fe038e70f6e Tom Zanussi       2018-01-15  6249  			ret =3D -EBUSY;
067fe038e70f6e Tom Zanussi       2018-01-15  6250  			goto out_free;
067fe038e70f6e Tom Zanussi       2018-01-15  6251  		}
067fe038e70f6e Tom Zanussi       2018-01-15  6252  =

7ef224d1d0e3a1 Tom Zanussi       2016-03-03 @6253  		cmd_ops->unreg(glob+1,=
 trigger_ops, trigger_data, file);
4b147936fa5096 Tom Zanussi       2018-01-15  6254  		se_name =3D trace_even=
t_name(file->event_call);
4b147936fa5096 Tom Zanussi       2018-01-15  6255  		se =3D find_synth_even=
t(se_name);
4b147936fa5096 Tom Zanussi       2018-01-15  6256  		if (se)
4b147936fa5096 Tom Zanussi       2018-01-15  6257  			se->ref--;
7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6258  		ret =3D 0;
7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6259  		goto out_free;
7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6260  	}
7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6261  =

c62ecf84dee35f Tom Zanussi       2021-11-05  6262  	ret =3D event_trigger_r=
egister(cmd_ops, file, glob, cmd, param, trigger_data, &n_registered);
c62ecf84dee35f Tom Zanussi       2021-11-05  6263  	if (ret)
c62ecf84dee35f Tom Zanussi       2021-11-05  6264  		goto out_free;
c62ecf84dee35f Tom Zanussi       2021-11-05  6265  	if ((ret =3D=3D 0) && (=
n_registered =3D=3D 0)) {
e86ae9baacfa9e Tom Zanussi       2016-03-03  6266  		if (!(attrs->pause || =
attrs->cont || attrs->clear))
7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6267  			ret =3D -ENOENT;
7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6268  		goto out_free;
c62ecf84dee35f Tom Zanussi       2021-11-05  6269  	}
067fe038e70f6e Tom Zanussi       2018-01-15  6270  =

067fe038e70f6e Tom Zanussi       2018-01-15  6271  	if (get_named_trigger_d=
ata(trigger_data))
067fe038e70f6e Tom Zanussi       2018-01-15  6272  		goto enable;
067fe038e70f6e Tom Zanussi       2018-01-15  6273  =

067fe038e70f6e Tom Zanussi       2018-01-15  6274  	if (has_hist_vars(hist_=
data))
067fe038e70f6e Tom Zanussi       2018-01-15  6275  		save_hist_vars(hist_da=
ta);
067fe038e70f6e Tom Zanussi       2018-01-15  6276  =

7d18a10c316783 Tom Zanussi       2019-02-13  6277  	ret =3D create_actions(=
hist_data);
0212e2aa30e112 Tom Zanussi       2018-01-15  6278  	if (ret)
0212e2aa30e112 Tom Zanussi       2018-01-15  6279  		goto out_unreg;
0212e2aa30e112 Tom Zanussi       2018-01-15  6280  =

067fe038e70f6e Tom Zanussi       2018-01-15  6281  	ret =3D tracing_map_ini=
t(hist_data->map);
067fe038e70f6e Tom Zanussi       2018-01-15  6282  	if (ret)
067fe038e70f6e Tom Zanussi       2018-01-15  6283  		goto out_unreg;
067fe038e70f6e Tom Zanussi       2018-01-15  6284  enable:
067fe038e70f6e Tom Zanussi       2018-01-15  6285  	ret =3D hist_trigger_en=
able(trigger_data, file);
067fe038e70f6e Tom Zanussi       2018-01-15  6286  	if (ret)
067fe038e70f6e Tom Zanussi       2018-01-15  6287  		goto out_unreg;
067fe038e70f6e Tom Zanussi       2018-01-15  6288  =

4b147936fa5096 Tom Zanussi       2018-01-15  6289  	se_name =3D trace_event=
_name(file->event_call);
4b147936fa5096 Tom Zanussi       2018-01-15  6290  	se =3D find_synth_event=
(se_name);
4b147936fa5096 Tom Zanussi       2018-01-15  6291  	if (se)
4b147936fa5096 Tom Zanussi       2018-01-15  6292  		se->ref++;
7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6293  	/* Just return zero, no=
t the number of registered triggers */
7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6294  	ret =3D 0;
7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6295   out:
f404da6e1d46ce Tom Zanussi       2018-01-15  6296  	if (ret =3D=3D 0)
f404da6e1d46ce Tom Zanussi       2018-01-15  6297  		hist_err_clear();
f404da6e1d46ce Tom Zanussi       2018-01-15  6298  =

7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6299  	return ret;
067fe038e70f6e Tom Zanussi       2018-01-15  6300   out_unreg:
067fe038e70f6e Tom Zanussi       2018-01-15  6301  	cmd_ops->unreg(glob+1, =
trigger_ops, trigger_data, file);
7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6302   out_free:
c62ecf84dee35f Tom Zanussi       2021-11-05  6303  	event_trigger_reset_fil=
ter(cmd_ops, trigger_data);
7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6304  =

067fe038e70f6e Tom Zanussi       2018-01-15  6305  	remove_hist_vars(hist_d=
ata);
067fe038e70f6e Tom Zanussi       2018-01-15  6306  =

7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6307  	kfree(trigger_data);
7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6308  =

7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6309  	destroy_hist_data(hist_=
data);
7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6310  	goto out;
7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6311  }
7ef224d1d0e3a1 Tom Zanussi       2016-03-03  6312  =


:::::: The code at line 6253 was first introduced by commit
:::::: 7ef224d1d0e3a1ade02d02c01ce1dcffb736d2c3 tracing: Add 'hist' event t=
rigger command

:::::: TO: Tom Zanussi <tom.zanussi@linux.intel.com>
:::::: CC: Steven Rostedt <rostedt@goodmis.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1993867650040390698==--

