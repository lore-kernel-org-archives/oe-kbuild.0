Content-Type: multipart/mixed; boundary="===============6762272741376482613=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [zanussi-trace:ftrace/cleanup-hist-func-v4 4/4] kernel/trace/trace_events_trigger.c:1007 event_trigger_parse() error: uninitialized symbol 'trigger_ops'.
Date: Sat, 11 Dec 2021 19:10:56 +0800
Message-ID: <202112111944.X7C1qDsb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6762272741376482613==
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
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: x86_64-randconfig-m001-20211210 (https://download.01.org/0day-ci/ar=
chive/20211211/202112111944.X7C1qDsb-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/trace/trace_events_trigger.c:1007 event_trigger_parse() error: unini=
tialized symbol 'trigger_ops'.
kernel/trace/trace_events_trigger.c:1736 event_enable_trigger_parse() error=
: uninitialized symbol 'trigger_data'.

vim +/trigger_ops +1007 kernel/trace/trace_events_trigger.c

4579e8fbf60ca9 Tom Zanussi              2021-11-05   963  =

4579e8fbf60ca9 Tom Zanussi              2021-11-05   964  /*
4579e8fbf60ca9 Tom Zanussi              2021-11-05   965   * End event trig=
ger parsing helper functions.
4579e8fbf60ca9 Tom Zanussi              2021-11-05   966   */
4579e8fbf60ca9 Tom Zanussi              2021-11-05   967  =

2a2df321158817 Tom Zanussi              2013-10-24   968  /**
7784e321840752 Tom Zanussi              2021-12-09   969   * event_trigger_=
parse - Generic event_command @parse implementation
2a2df321158817 Tom Zanussi              2013-10-24   970   * @cmd_ops: The =
command ops, used for trigger registration
7f1d2f8210195c Steven Rostedt (Red Hat  2015-05-05   971)  * @file: The tra=
ce_event_file associated with the event
2a2df321158817 Tom Zanussi              2013-10-24   972   * @glob: The raw=
 string used to register the trigger
2a2df321158817 Tom Zanussi              2013-10-24   973   * @cmd: The cmd =
portion of the string used to register the trigger
c62ecf84dee35f Tom Zanussi              2021-11-05   974   * @param_and_fil=
ter: The param and filter portion of the string used to register the trigger
2a2df321158817 Tom Zanussi              2013-10-24   975   *
2a2df321158817 Tom Zanussi              2013-10-24   976   * Common impleme=
ntation for event command parsing and trigger
2a2df321158817 Tom Zanussi              2013-10-24   977   * instantiation.
2a2df321158817 Tom Zanussi              2013-10-24   978   *
7784e321840752 Tom Zanussi              2021-12-09   979   * Usually used d=
irectly as the @parse method in event command
2a2df321158817 Tom Zanussi              2013-10-24   980   * implementation=
s.
2a2df321158817 Tom Zanussi              2013-10-24   981   *
2a2df321158817 Tom Zanussi              2013-10-24   982   * Return: 0 on s=
uccess, errno otherwise
2a2df321158817 Tom Zanussi              2013-10-24   983   */
2a2df321158817 Tom Zanussi              2013-10-24   984  static int
7784e321840752 Tom Zanussi              2021-12-09   985  event_trigger_par=
se(struct event_command *cmd_ops,
7f1d2f8210195c Steven Rostedt (Red Hat  2015-05-05   986) 		    struct trac=
e_event_file *file,
c62ecf84dee35f Tom Zanussi              2021-11-05   987  		    char *glob,=
 char *cmd, char *param_and_filter)
2a2df321158817 Tom Zanussi              2013-10-24   988  {
2a2df321158817 Tom Zanussi              2013-10-24   989  	struct event_tri=
gger_data *trigger_data;
2a2df321158817 Tom Zanussi              2013-10-24   990  	struct event_tri=
gger_ops *trigger_ops;
c62ecf84dee35f Tom Zanussi              2021-11-05   991  	char *param, *fi=
lter;
c62ecf84dee35f Tom Zanussi              2021-11-05   992  	bool remove;
2a2df321158817 Tom Zanussi              2013-10-24   993  	int ret;
2a2df321158817 Tom Zanussi              2013-10-24   994  =

c62ecf84dee35f Tom Zanussi              2021-11-05   995  	remove =3D event=
_trigger_check_remove(glob);
2a2df321158817 Tom Zanussi              2013-10-24   996  =

c62ecf84dee35f Tom Zanussi              2021-11-05   997  	ret =3D event_tr=
igger_separate_filter(param_and_filter, &param, &filter, false);
c62ecf84dee35f Tom Zanussi              2021-11-05   998  	if (ret)
c62ecf84dee35f Tom Zanussi              2021-11-05   999  		return ret;
2a2df321158817 Tom Zanussi              2013-10-24  1000  =

2a2df321158817 Tom Zanussi              2013-10-24  1001  	ret =3D -ENOMEM;
c62ecf84dee35f Tom Zanussi              2021-11-05  1002  	trigger_data =3D=
 event_trigger_alloc(cmd_ops, cmd, param, file);
2a2df321158817 Tom Zanussi              2013-10-24  1003  	if (!trigger_dat=
a)
2a2df321158817 Tom Zanussi              2013-10-24  1004  		goto out;
2a2df321158817 Tom Zanussi              2013-10-24  1005  =

c62ecf84dee35f Tom Zanussi              2021-11-05  1006  	if (remove) {
2a2df321158817 Tom Zanussi              2013-10-24 @1007  		cmd_ops->unreg(=
glob+1, trigger_ops, trigger_data, file);
2a2df321158817 Tom Zanussi              2013-10-24  1008  		kfree(trigger_d=
ata);
2a2df321158817 Tom Zanussi              2013-10-24  1009  		ret =3D 0;
2a2df321158817 Tom Zanussi              2013-10-24  1010  		goto out;
2a2df321158817 Tom Zanussi              2013-10-24  1011  	}
2a2df321158817 Tom Zanussi              2013-10-24  1012  =

c62ecf84dee35f Tom Zanussi              2021-11-05  1013  	ret =3D event_tr=
igger_parse_num(param, trigger_data);
2a2df321158817 Tom Zanussi              2013-10-24  1014  	if (ret)
2a2df321158817 Tom Zanussi              2013-10-24  1015  		goto out_free;
2a2df321158817 Tom Zanussi              2013-10-24  1016  =

c62ecf84dee35f Tom Zanussi              2021-11-05  1017  	ret =3D event_tr=
igger_set_filter(cmd_ops, file, filter, trigger_data);
2a2df321158817 Tom Zanussi              2013-10-24  1018  	if (ret < 0)
2a2df321158817 Tom Zanussi              2013-10-24  1019  		goto out_free;
2a2df321158817 Tom Zanussi              2013-10-24  1020  =

1863c387259b62 Steven Rostedt (VMware   2018-07-24  1021) 	/* Up the trigge=
r_data count to make sure reg doesn't free it on failure */
1863c387259b62 Steven Rostedt (VMware   2018-07-24  1022) 	event_trigger_in=
it(trigger_ops, trigger_data);
c62ecf84dee35f Tom Zanussi              2021-11-05  1023  =

c62ecf84dee35f Tom Zanussi              2021-11-05  1024  	ret =3D event_tr=
igger_register(cmd_ops, file, glob, cmd, param, trigger_data, NULL);
c62ecf84dee35f Tom Zanussi              2021-11-05  1025  	if (ret)
c62ecf84dee35f Tom Zanussi              2021-11-05  1026  		goto out_free;
1863c387259b62 Steven Rostedt (VMware   2018-07-24  1027) =

1863c387259b62 Steven Rostedt (VMware   2018-07-24  1028) 	/* Down the coun=
ter of trigger_data or free it if not used anymore */
1863c387259b62 Steven Rostedt (VMware   2018-07-24  1029) 	event_trigger_fr=
ee(trigger_ops, trigger_data);
2a2df321158817 Tom Zanussi              2013-10-24  1030   out:
2a2df321158817 Tom Zanussi              2013-10-24  1031  	return ret;
2a2df321158817 Tom Zanussi              2013-10-24  1032   out_free:
c62ecf84dee35f Tom Zanussi              2021-11-05  1033  	event_trigger_re=
set_filter(cmd_ops, trigger_data);
2a2df321158817 Tom Zanussi              2013-10-24  1034  	kfree(trigger_da=
ta);
2a2df321158817 Tom Zanussi              2013-10-24  1035  	goto out;
2a2df321158817 Tom Zanussi              2013-10-24  1036  }
2a2df321158817 Tom Zanussi              2013-10-24  1037  =


:::::: The code@line 1007 was first introduced by commit
:::::: 2a2df321158817811c5dc206dce808e0aa9f6d89 tracing: Add 'traceon' and =
'traceoff' event trigger commands

:::::: TO: Tom Zanussi <tom.zanussi@linux.intel.com>
:::::: CC: Steven Rostedt <rostedt@goodmis.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6762272741376482613==--

