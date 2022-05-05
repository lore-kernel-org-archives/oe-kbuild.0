Content-Type: multipart/mixed; boundary="===============0407447629629577213=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [linux-next:master 408/8237] drivers/net/wireless/ath/ath11k/wow.c:712 ath11k_wow_op_resume() warn: inconsistent returns '&ar->conf_mutex'.
Date: Thu, 05 May 2022 08:58:17 +0300
Message-ID: <20220505055817.GQ4031@kadam>
In-Reply-To: <fd76aa54-4d05-a4b0-b3b4-11c8a5be799c@quicinc.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0407447629629577213==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 05, 2022 at 09:29:40AM +0800, Carl Huang wrote:
> Hi Kalle,
> =

> Is the below the same fix that you have already applied to ath.git?
> =

> [-next] ath11k: fix missing unlock on error in ath11k_wow_op_resume() -
> Patchwork (kernel.org) <https://patchwork.kernel.org/project/linux-wirele=
ss/patch/20220408030912.3087293-1-yangyingliang@huawei.com/
> >

That looks good.  It's sort of annoying for me to send a bug report a
month after the fix has been applied...  Sorry about that.

1) These are kbuild warnings.  The zero day bot generates the
warnings and I look them over and hit send.  I don't know why the kbuild
bot seems to get confused by -mm.  The subject says 408/8237 which is
pretty crazy.  Maybe I should just ignore the -mm patches?

2) The blamed patch came from a git tree but it had a Link tag to
lore.kernel.org so we could have used that as an In-Reply-to tag.
In an ideal world, all the bug reports for a patch would go to a
standard location.

Link: https://lore.kernel.org/r/1644308006-22784-5-git-send-email-quic_cjhu=
ang(a)quicinc.com

3) Another idea is that the kbuild bot could search lore for Fixes to
the original commit and include links to those threads?

regards,
dan carpenter

--===============0407447629629577213==--

