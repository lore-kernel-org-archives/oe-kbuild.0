Content-Type: multipart/mixed; boundary="===============5239823107453444604=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [trace:ftrace/ring-buffer-irq-timestamp 1/7] kernel/trace/trace.c:3356 trace_array_printk() warn: variable dereferenced before check 'tr' (see line 3353)
Date: Mon, 29 Jun 2020 16:50:14 +0300
Message-ID: <20200629135014.GJ2571@kadam>
In-Reply-To: <20200629090512.53d19ec2@oasis.local.home>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5239823107453444604==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2020 at 09:05:12AM -0400, Steven Rostedt wrote:
> On Mon, 29 Jun 2020 13:57:10 +0300
> Dan Carpenter <dan.carpenter@oracle.com> wrote:
> =

> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-t=
race.git ftrace/ring-buffer-irq-timestamp
> > head:   63afaf390ebc12f578d6bb4ced9ed4a35eab1c92
> > commit: 0b10b8f570623d0a82ce29089b9be3b3f53e5bf2 [1/7] tracing: Only al=
low trace_array_printk() to be used by instances
> > config: x86_64-randconfig-m001-20200629 (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-13) 9.3.0
> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > =

> > smatch warnings:
> > kernel/trace/trace.c:3356 trace_array_printk() warn: variable dereferen=
ced before check 'tr' (see line 3353)
> =

> Thanks for the report.
> =

> As this is not in a upstream tree yet (it's only in my development
> branch) and I'm going to fold the fix into the original commit. It
> doesn't make sense to add a "Reported-by" because the issue that was
> reported got fixed and folded, Reported-by is for issues that the patch
> fixes not issues for the patch itself.
> =

> Should I just put in a "Reviewed-by: kernel test robot <lkp@intel.com>"=
 and
> "Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>" ?

Nah...  Forget about it.  These are just a template email that kbuild
sends and I forward it.  Just ignore it when it doesn't make sense.

regards,
dan carpenter

--===============5239823107453444604==--

