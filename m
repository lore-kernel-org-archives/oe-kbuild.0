Content-Type: multipart/mixed; boundary="===============5570013365371827847=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [zanussi-trace:ftrace/masami-hitcount-v0 1/3] kernel/trace/trace_events_hist.c:4354 create_val_fields() error: uninitialized symbol 'n_hitcount'.
Date: Fri, 26 Aug 2022 13:30:51 +0800
Message-ID: <202208261355.j5zhO4zb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5570013365371827847==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Tom Zanussi <zanussi@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/zanussi/linux-trace=
.git ftrace/masami-hitcount-v0
head:   886fe9b6098eddb9d298e8a3f07bbea61acdac16
commit: 2b0a73549f8fb4115c06639c75a4b7abd7825aaa [1/3] tracing: Allow multi=
ple hitcount values in histograms
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
826/202208261355.j5zhO4zb-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/trace/trace_events_hist.c:4354 create_val_fields() error: uninitiali=
zed symbol 'n_hitcount'.

vim +/n_hitcount +4354 kernel/trace/trace_events_hist.c

30350d65ac5676 Tom Zanussi 2018-01-15  4331  =

7ef224d1d0e3a1 Tom Zanussi 2016-03-03  4332  static int create_val_fields(s=
truct hist_trigger_data *hist_data,
7ef224d1d0e3a1 Tom Zanussi 2016-03-03  4333  			     struct trace_event_fil=
e *file)
7ef224d1d0e3a1 Tom Zanussi 2016-03-03  4334  {
2b0a73549f8fb4 Tom Zanussi 2022-08-24  4335  	unsigned int i, j =3D 1, n_hi=
tcount;
f2606835d70d2a Tom Zanussi 2016-03-03  4336  	char *fields_str, *field_str;
7ef224d1d0e3a1 Tom Zanussi 2016-03-03  4337  	int ret;
7ef224d1d0e3a1 Tom Zanussi 2016-03-03  4338  =

7ef224d1d0e3a1 Tom Zanussi 2016-03-03  4339  	ret =3D create_hitcount_val(h=
ist_data);
f2606835d70d2a Tom Zanussi 2016-03-03  4340  	if (ret)
f2606835d70d2a Tom Zanussi 2016-03-03  4341  		goto out;
7ef224d1d0e3a1 Tom Zanussi 2016-03-03  4342  =

f2606835d70d2a Tom Zanussi 2016-03-03  4343  	fields_str =3D hist_data->att=
rs->vals_str;
f2606835d70d2a Tom Zanussi 2016-03-03  4344  	if (!fields_str)
f2606835d70d2a Tom Zanussi 2016-03-03  4345  		goto out;
f2606835d70d2a Tom Zanussi 2016-03-03  4346  =

f2606835d70d2a Tom Zanussi 2016-03-03  4347  	for (i =3D 0, j =3D 1; i < TR=
ACING_MAP_VALS_MAX &&
f2606835d70d2a Tom Zanussi 2016-03-03  4348  		     j < TRACING_MAP_VALS_MA=
X; i++) {
f2606835d70d2a Tom Zanussi 2016-03-03  4349  		field_str =3D strsep(&fields=
_str, ",");
f2606835d70d2a Tom Zanussi 2016-03-03  4350  		if (!field_str)
f2606835d70d2a Tom Zanussi 2016-03-03  4351  			break;
30350d65ac5676 Tom Zanussi 2018-01-15  4352  =

2b0a73549f8fb4 Tom Zanussi 2022-08-24  4353  		if (strcmp(field_str, "hitco=
unt") =3D=3D 0) {
2b0a73549f8fb4 Tom Zanussi 2022-08-24 @4354  			if (!n_hitcount++)
f2606835d70d2a Tom Zanussi 2016-03-03  4355  				continue;
2b0a73549f8fb4 Tom Zanussi 2022-08-24  4356  		}
30350d65ac5676 Tom Zanussi 2018-01-15  4357  =

f2606835d70d2a Tom Zanussi 2016-03-03  4358  		ret =3D create_val_field(his=
t_data, j++, file, field_str);
f2606835d70d2a Tom Zanussi 2016-03-03  4359  		if (ret)
f2606835d70d2a Tom Zanussi 2016-03-03  4360  			goto out;
f2606835d70d2a Tom Zanussi 2016-03-03  4361  	}
30350d65ac5676 Tom Zanussi 2018-01-15  4362  =

f2606835d70d2a Tom Zanussi 2016-03-03  4363  	if (fields_str && (strcmp(fie=
lds_str, "hitcount") !=3D 0))
f2606835d70d2a Tom Zanussi 2016-03-03  4364  		ret =3D -EINVAL;
f2606835d70d2a Tom Zanussi 2016-03-03  4365   out:
7ef224d1d0e3a1 Tom Zanussi 2016-03-03  4366  	return ret;
7ef224d1d0e3a1 Tom Zanussi 2016-03-03  4367  }
7ef224d1d0e3a1 Tom Zanussi 2016-03-03  4368  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5570013365371827847==--

