Content-Type: multipart/mixed; boundary="===============7073126622327956101=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v3 07/15] fsnotify: pass arguments of fsnotify() in struct fsnotify_event_info
Date: Wed, 30 Jun 2021 13:49:04 +0300
Message-ID: <20210630104904.GS2040@kadam>
In-Reply-To: <CAOQ4uxiCYBL2-FVMbn2RWcQnueueVoAd5sBtte+twLoU9eyFgA@mail.gmail.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7073126622327956101==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I think my bug report was not clear...  :/  The code looks like this:

	sb =3D inode->i_sb;

	if (inode) ...

The NULL check cannot be false because if "inode" is NULL we would have
already crashed when we dereference it on the line before.

In this case, based on last years discussion, the "inode" pointer can't
be NULL.  The debate is only whether the unnecessary NULL checks help
readability or hurt readability.

> Why does it presume that event_info->dir is non-NULL?

That was my commentary, just from reading the code.  Smatch says that
"event->dir" is unknown.

> Did smach check all the callers to fsnotify() or something?

The kbuild-bot doesn't build the cross function database but if you did
use the cross function database then, yes, it does track all the
callers.  There are two pointers that we care about, the "inode" and
the parent inode (dir).  Smatch can figure out when "inode" is NULL vs
non-NULL but where it gets stuck is on the some of the parent inodes
like this call from fsnotify_dirent():

	fsnotify_name(dir, mask, d_inode(dentry), &dentry->d_name, 0);
                                 ^^^^^^^^^^^^^^^

Smatch doesn't know that d_inode() is always non-NULL at this point.

regards,
dan carpenter
--===============7073126622327956101==--

