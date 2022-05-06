Content-Type: multipart/mixed; boundary="===============1479332787221168233=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [kbuild-all] Re: [linux-next:master 408/8237] drivers/net/wireless/ath/ath11k/wow.c:712 ath11k_wow_op_resume() warn: inconsistent returns '&ar->conf_mutex'.
Date: Fri, 06 May 2022 13:24:25 +0300
Message-ID: <20220506102425.GF4031@kadam>
In-Reply-To: <e8b3efec-dcf9-0ab8-e2a9-b2a514a14d49@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1479332787221168233==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 06, 2022 at 05:58:22PM +0800, Chen, Rong A wrote:
> =

> =

> On 5/6/2022 4:46 PM, Kalle Valo wrote:
> > Dan Carpenter <dan.carpenter@oracle.com> writes:
> > =

> > > On Thu, May 05, 2022 at 09:29:40AM +0800, Carl Huang wrote:
> > > > Hi Kalle,
> > > > =

> > > > Is the below the same fix that you have already applied to ath.git?
> > > > =

> > > > [-next] ath11k: fix missing unlock on error in ath11k_wow_op_resume=
() -
> > > > Patchwork (kernel.org)
> > > > <https://patchwork.kernel.org/project/linux-wireless/patch/20220408=
030912.3087293-1-yangyingliang@huawei.com/
> > > > > =

> > > =

> > > That looks good.  It's sort of annoying for me to send a bug report a
> > > month after the fix has been applied...  Sorry about that.
> > =

> > My ath.git tree is not included in linux-wireless builds so there's also
> > a delay before linux-next sees the fix.
> =

> Hi,
> =

> Sorry for the overdue report , we'll take a look to prevent the same
> problem arising again.
> =

> > =

> > > 1) These are kbuild warnings.  The zero day bot generates the
> > > warnings and I look them over and hit send.  I don't know why the kbu=
ild
> > > bot seems to get confused by -mm.  The subject says 408/8237 which is
> > > pretty crazy.  Maybe I should just ignore the -mm patches?
> > =

> > Yeah, I have been also wondering about using -mm for ath11k reports.
> > Does anyone know why that's happening?
> =

> We don't have a filter to ignore some warnings from specific branches,
> we can create one to only report ath11k issues if found in ath.git,
> please remind me if there are other rules.
> =


The problem is really specific to the -mm tree.  They always have
look like they're a part of a 1000+ series of patches.  There was another
one today:

[kbuild] [linux-next:master 5904/9357] kernel/bpf/verifier.c:5331 process_k=
ptr_func() warn: passing zero to 'PTR_ERR'

That warning is a false positive but a high quality false positive.
A lot of the "passing valid pointers" to PTR_ERR() bugs are caused
because Smatch thinks some arches have signed pointers.  I'm not sure
what's up with that...  :/  My bad.  Those are on me.

> > =

> > > 2) The blamed patch came from a git tree but it had a Link tag to
> > > lore.kernel.org so we could have used that as an In-Reply-to tag.
> > > In an ideal world, all the bug reports for a patch would go to a
> > > standard location.
> > > =

> > > Link:
> > > https://lore.kernel.org/r/1644308006-22784-5-git-send-email-quic_cjhu=
ang(a)quicinc.com
> > =

> > Yeah, that would be nice.
> =

> We have already linked the bug reports to the patch if the patch hasn't
> been applied, I'm not sure is it possible to find the link of patch if
> it's already applied in a branch.

You could git do:

	git show 90bf5c8d0f7ecddf96fc1cd9434af4e157b51970 | grep "Link: https://lo=
re.kernel.org/r/"

Some of the links are to freedesktop which also has the msgid.

	Link: https://patchwork.freedesktop.org/patch/msgid/20220504090229.2506560=
-1-l.stach(a)pengutronix.de

We're really trying to discourage links to other websites because it's
not under our control and it will break.  And you wouldn't have the CC
list either...  But I still think it's useful.

regards,
dan carpenter

--===============1479332787221168233==--

