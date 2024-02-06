Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6AD131E56
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Feb 2024 14:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707230948; cv=none; b=oKkW9/1aRzC6Xj+jpVKfa5inA87NPZEp269hyVn1LQacoaFYt5/eJC/MvGbH7joxZp0A2Q6H0/tDlHywgu6FlB0Cg45aXC+pgknikzNm3Z6e5cQFYrhqJ0OmKM4qTci/1tigNn2YIafpaJ1HGOoxZrCWBiZMutnCWRAJFHUBJ3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707230948; c=relaxed/simple;
	bh=ZYhM25AzuOO8uiA+4AJts7dxWvnoP0sziHlbTBDdgdU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=T9tzUqnlCZiBvT1KW6mvvRNWxIyLJ+YjmwW6NldAt7ssJbZzwGeXRQZWNtMdPQHoPSi1Tsr2nb3vdHB+15HgedKNY19HzLZZdjn2JEIwdrc5TX1VvbcHb1OsKcdCeMVjU7RZd3n2q9Br/dcfUIb3QuG3hApw6hHNLWejU8QqLP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-7bedddd00d5so490096339f.3
        for <oe-kbuild@lists.linux.dev>; Tue, 06 Feb 2024 06:49:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707230946; x=1707835746;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kSrsdZ/RuKV0gEG27LOO5dIr8YmZtFDZ3FYa41rVAQo=;
        b=Rfswx9uJWCz4lVpmmKiDDgsIrcvpqf6L21U+0/SOIoIv8qFjESORAbLfSKLLTYpfTf
         CLmciXMIckCz41DKo0An+jyINJzJKvAhdkB6erPqEWafW82DiXUGpPFeq/XO7b85tScA
         nT/JmXVo1VEULzCbkczHdW7mTZjoGe4asX07K/AcFfEYkwWcfUJpo+UWYvvEfiq+RsB3
         K8MUCl/m77x7TgwIyT7teSY5O/F32uufc2F2R7CaY2CR+iCN+kMOy6JZeL4UfDlPbiFo
         +wPsLiuppb7UIrQBNELSl9OzsOmM4lRbKhEbP49T+LI1r70zn0Nf8c9rqXP5bbIcaGSj
         pM4A==
X-Gm-Message-State: AOJu0YwskLdOwP/GI7trjjeScZCwBGaoi50TAX3qN6xbK9QvUcHK8kQh
	gss6Va6N7Kj2YuK0YGT79Waw+LwUPNadywMPniPVgV8arjsWzuVfQD7coYi/0oI/dPGeG/8AYrI
	2dACDSKQEe6HcbcluOKiqXqwL5IMsGzc18YjW5wzC/zxAnpvbXDFWRrQ=
X-Google-Smtp-Source: AGHT+IGyJ27bMyWH8/GynoFXTjuNU5g+uu1OXbn98nBQ0bYYkpj0BC/KPVZdYE7KwK+zDcXtX/Ot0QVWkk9m9WuMvI7pjKLzBruq
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:154d:b0:363:a059:670b with SMTP id
 j13-20020a056e02154d00b00363a059670bmr186965ilu.4.1707230945919; Tue, 06 Feb
 2024 06:49:05 -0800 (PST)
Date: Tue, 06 Feb 2024 06:49:05 -0800
In-Reply-To: <000000000000332a2505e981f474@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000014c9ca0610b7aec6@google.com>
Subject: Re: [syzbot] [jfs?] KASAN: slab-out-of-bounds Read in dtSearch
From: syzbot <syzbot+9924e2a08d9ba0fd4ce2@syzkaller.appspotmail.com>
To: axboe@kernel.dk, brauner@kernel.org, dan.carpenter@linaro.org, 
	dave.kleikamp@oracle.com, ghandatmanas@gmail.com, jack@suse.cz, 
	jfs-discussion@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org, 
	lkp@intel.com, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	oe-kbuild@lists.linux.dev, shaggy@kernel.org, syzkaller-bugs@googlegroups.com, 
	syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13767e8fe80000
start commit:   bee0e7762ad2 Merge tag 'for-linus-iommufd' of git://git.ke..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=b45dfd882e46ec91
dashboard link: https://syzkaller.appspot.com/bug?extid=9924e2a08d9ba0fd4ce2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=152bfc22e80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1608f4a2e80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
