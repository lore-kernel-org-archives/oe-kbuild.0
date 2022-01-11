Content-Type: multipart/mixed; boundary="===============4284232015611759548=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH bpf-next] Fix incorrect integer literal used for marking scratched registers in verifier logs
Date: Tue, 11 Jan 2022 12:48:35 +0300
Message-ID: <20220111094835.GJ1978@kadam>
In-Reply-To: <CAPqJDZqf8-4DCe9J1jr7KekxqfBac3JBc+hx7a6qW4hoF6xPUQ@mail.gmail.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4284232015611759548==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 10, 2022 at 02:12:58PM -0800, Christy Lee wrote:
> On Mon, Jan 10, 2022 at 1:52 PM Song Liu <song@kernel.org> wrote:
> >
> > On Fri, Jan 7, 2022 at 4:59 PM Christy Lee <christylee@fb.com> wrote:
> > >
> > > env->scratched_stack_slots is a 64-bit value, we should use ULL
> > > instead of UL literal values.
> > >
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > Signed-off-by: Christy Lee <christylee@fb.com>
> >
> > The fix looks good to me. Thus:
> >
> > Acked-by: Song Liu <songliubraving@fb.com>
> >
> > However, the patch looks corrupted. Also, the subject is probably too
> > long (./scripts/checkpatch.pl should complain about it).
> >
> =

> I just checked that even with an absurdly long subject (more than 200
> characters), ./scripts/checkpatch.pl doesn't complain. It only complains
> when the commit message body has longer than 75 characters but not the
> subject line.  What's the maximum subject line length?
> =


People say 50 characters but that just seems more aspirational than
realistic.  This patch needs a subsystem prefix as well.

regards,
dan carpenter

--===============4284232015611759548==--

