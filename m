Content-Type: multipart/mixed; boundary="===============4069368991750780998=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
Subject: Re: [PATCH 05/22] btrfs: add the beginning of async discard, discard workqueue
Date: Tue, 26 Nov 2019 09:42:10 +0800
Message-ID: <20191126014209.GB21240@intel.com>
In-Reply-To: <CAKwvOdnaiXo8qqK_tyiYvw5Fo4HvdFzrMxLU7k62qEWucC-58Q@mail.gmail.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4069368991750780998==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2019 at 11:39:08AM -0800, Nick Desaulniers wrote:
> On Mon, Nov 25, 2019 at 10:59 AM Dennis Zhou <dennis@kernel.org> wrote:
> >
> > On Thu, Nov 21, 2019 at 08:27:43PM -0800, Nick Desaulniers wrote:
> > > Hi Dennis,
> > > Below is a 0day bot report from a build w/ Clang. Warning looks legit,
> > > can you please take a look?
> > >
> >
> > Ah thanks for this! Yeah that was a miss when I switched from flags ->
> > an enum and didn't update the declaration properly. I'll be sending out
> > a v4 as another fix for arm has some rebase conflicts.
> >
> > Is there a way to enable so I get these emails directly?
> =

> + Rong, Philip
> =

> The reports have only been sent to our mailing list where we've been
> manually triaging them.  The issue with enabling them globally was
> that the script to reproduce the warning still doesn't mention how to
> build w/ Clang.
Thanks Nick for continuous caring on this. One thing we initially worry
is how to avoid duplicated reports to developer, like the one that can
be same as gcc's finding. We haven't found a way to effectively handle
this.

> =

> In general the reports have been high value (I ignore most reports
> with -Wimplicit-function-declaration, which is the most frequent as it
> shows the patch was not compile tested at all).
Do we mean the report with -Wimplicit-function-declaration can be duplicated
to gcc, so we can ignore them to avoid duplication to developer?

> =

> Rong, Philip, it's been a while since we talked about this last. Is
> there a general timeline of when these reports will be turned on
> globally?  Even if the directions to reproduce aren't quite right,
For the timeline, it's not decided due to the duplication concern. We tend
to look into next year after other priorities are solved for this year.

> generally there's enough info in the existing bugs where authors can
> rewrite their patch without even needing to rebuild with Clang (though
> having correct directions to reproduce would be nice, we could wait
> until someone asked for them explicitly).
> =

> -- =

> Thanks,
> ~Nick Desaulniers
--===============4069368991750780998==--

