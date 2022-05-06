Content-Type: multipart/mixed; boundary="===============0787964797887103048=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: uninitialized variables bugs
Date: Fri, 06 May 2022 12:13:38 +0300
Message-ID: <20220506091338.GE4031@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0787964797887103048==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Ever since commit 78a5255ffb6a ("Stop the ad-hoc games with
-Wno-maybe-initialized"), GCC's uninitialized variable warnings have
been disabled by default.  Now, you have to turn on W=3D1 or W=3D2 to see
the warnings which nobody except Arnd does.

Disabling that has lead to a bunch of embarrassing bugs where variables
are *never* initialized.  Very unsubtle bugs.  The bugs doesn't reach
users because Nathan Chancellor and I review Clang and Smatch warnings
respectively.  Also the kbuild-bot reports uninitialized variables.

It's a lot to deal with.  Uninitialized variable bugs are probably the
most common bug I have to deal with.

It's frustrating.  Sometimes the false positives are hard to analyse
because I have to read through multiple functions.  A lot of times
when I write a patch and a commit message Nathan has already fixed it
so it's just a waste of time.

It's risky as well.  The Smatch check for uninitialized variables was
broken for most of 2021.  Nathan sometimes goes on vacation.

I guess I would hope that one day we can turn on the GCC uninitialized
variable warnings again.  That would mean silencing false positives
which a lot of people don't want to do...  Maybe Clang has fewer false
positives than GCC?

The Smatch check for uninitialized variable was deliberately written to
be more strict than GCC because GCC was missing bugs.  So I think
leaving Smatch false positives is fine.  There is a trade off between
fewer false positives and missing bugs and Smatch is meant to err on the
side of finding bugs but with the cost of false positives.

Most of the Smatch uninitialized false positives are caused by loops:

	int i, ret;

	for (i =3D 0; i < bytes; i++) { // <-- what if bytes is zero?
		if (...)
			continue; // <-- can every iteration hit continue?
		ret =3D frob();
	}

	return ret;

There is also stuff like this which is harmless:

	uint val;

	ret =3D read(&val);
	*p =3D val;  // <-- uninitialized variable if read() fails
	return ret;

Btw, here is how to run Smatch on your code:
https://staticthinking.wordpress.com/2022/04/25/how-to-run-smatch-on-your-c=
ode/

regards,
dan carpenter

--===============0787964797887103048==--

