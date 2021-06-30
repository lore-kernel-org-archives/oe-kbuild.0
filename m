Content-Type: multipart/mixed; boundary="===============7593887626753287211=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v3 07/15] fsnotify: pass arguments of fsnotify() in struct fsnotify_event_info
Date: Wed, 30 Jun 2021 11:45:55 +0300
Message-ID: <20210630084555.GH1983@kadam>
In-Reply-To: <CAOQ4uxgRbpzo-AvvBxLQ5ARdFuX53RG+JpPOG8CDoEM2MdsWQQ@mail.gmail.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7593887626753287211==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 30, 2021 at 11:35:32AM +0300, Amir Goldstein wrote:
> =

> Do you have feeling of dejavu? ;-)
> https://lore.kernel.org/linux-fsdevel/20200730192537.GB13525(a)quack2.sus=
e.cz/ =


That was a year ago.  I have trouble remembering emails I sent
yesterday.

> =

> We've been through this.
> Maybe you silenced the smach warning on fsnotify() and the rename to
> __fsnotifty()
> caused this warning to refloat?

Yes.  Renaming the function will make it show up as a new warning.  Also
this is an email from the kbuild-bot and last years email was from me,
so it's a different tool and a different record of sent messages.

(IMO, you should really just remove the bogus NULL checks because
everyone looking at the warning will think the code is buggy).

regards,
dan carpenter
--===============7593887626753287211==--

