Content-Type: multipart/mixed; boundary="===============1704570050895158229=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: kernel/trace/trace_events_hist.c:6174 event_hist_trigger_parse() error: we previously assumed 'glob' could be null (see line 6166)
Date: Wed, 26 Jan 2022 17:50:20 +0300
Message-ID: <20220126145020.GB1978@kadam>
In-Reply-To: <20220126093918.268d0e42@gandalf.local.home>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1704570050895158229==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 26, 2022 at 09:39:18AM -0500, Steven Rostedt wrote:
> > 9ec5a7d16899ed Tom Zanussi             2022-01-10  6149  static int eve=
nt_hist_trigger_parse(struct event_command *cmd_ops,
> > 7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6150  				    struct=
 trace_event_file *file,
> > 7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6151  				    char *=
glob, char *cmd, char *param)
> > 7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6152  {
> > 7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6153  	unsigned int =
hist_trigger_bits =3D TRACING_MAP_BITS_DEFAULT;
> > 7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6154  	struct event_=
trigger_data *trigger_data;
> > 7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6155  	struct hist_t=
rigger_attrs *attrs;
> > 7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6156  	struct event_=
trigger_ops *trigger_ops;
> > 7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6157  	struct hist_t=
rigger_data *hist_data;
> > 4b147936fa5096 Tom Zanussi             2018-01-15  6158  	struct synth_=
event *se;
> > 4b147936fa5096 Tom Zanussi             2018-01-15  6159  	const char *s=
e_name;
> > 30350d65ac5676 Tom Zanussi             2018-01-15  6160  	bool remove =
=3D false;
> > c5eac6ee8bc5d3 Kalesh Singh            2021-10-25  6161  	char *trigger=
, *p, *start;
> > 7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6162  	int ret =3D 0;
> > 7ef224d1d0e3a1 Tom Zanussi             2016-03-03  6163  =

> > 0e2b81f7b52a1c Masami Hiramatsu        2018-11-05  6164  	lockdep_asser=
t_held(&event_mutex);
> > 0e2b81f7b52a1c Masami Hiramatsu        2018-11-05  6165  =

> > f404da6e1d46ce Tom Zanussi             2018-01-15 @6166  	if (glob && s=
trlen(glob)) {
> =

> I just reviewed the code, and it looks like the logic should keep glob fr=
om
> ever being NULL.

Smatch can also figure that out, and does not warn, if you have the
cross function DB.  Unfortunately, that's not feasible for the zero day
bot because it takes too long to build the DB.

I was puzzled why this warning showed up now when the code is from 2018.

regards,
dan carpenter

--===============1704570050895158229==--

