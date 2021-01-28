Content-Type: multipart/mixed; boundary="===============2498069294145781514=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [bug report] attr: handle idmapped mounts
Date: Thu, 28 Jan 2021 14:21:02 +0300
Message-ID: <YBKeHne9FZ42mich@mwanda>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2498069294145781514==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Christian Brauner,

The patch 2f221d6f7b88: "attr: handle idmapped mounts" from Jan 21,
2021, leads to the following static checker warning:

	fs/attr.c:129 setattr_prepare()
	warn: inconsistent indenting

fs/attr.c
   124		/* Make sure a caller can chmod. */
   125		if (ia_valid & ATTR_MODE) {
   126			if (!inode_owner_or_capable(mnt_userns, inode))
   127				return -EPERM;
   128			/* Also check the setgid bit! */
   129	               if (!in_group_p((ia_valid & ATTR_GID) ? attr->ia_gid :
      ^^^^^^^^^^^^^^^^^
The patch accidentally swapped tabs for spaces.

The kbuild-bot is supposed to warn about these, but I searched on the
lore.kernel.org thread and didn't see a warning.
https://lore.kernel.org/containers/20210121131959.646623-8-christian.braune=
r(a)ubuntu.com/
Presumably it is coming soon.

   130	                                i_gid_into_mnt(mnt_userns, inode)) &&
   131	                    !capable_wrt_inode_uidgid(mnt_userns, inode, CAP=
_FSETID))
   132				attr->ia_mode &=3D ~S_ISGID;
   133		}

regards,
dan carpenter
--===============2498069294145781514==--

