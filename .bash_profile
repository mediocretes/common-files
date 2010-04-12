# /etc/skel/.bash_profile:
# $Header: /home/cvsroot/gentoo-src/rc-scripts/etc/skel/.bash_profile,v 1.10 2002/11/18 19:39:22 azarah Exp $

#This file is sourced by bash when you log in interactively.
[ -f ~/.bashrc ] && . ~/.bashrc

for k in /usr/bin/keychain /opt/local/bin/keychain; do
    if [ -f $k ]; then
        for i in ~/.ssh/*; do
            [ -f $i ] && [ -f $i.pub ] && $k --nogui $i
        done
#     [ -f ~/.ssh/id_dsa ] && /usr/bin/keychain --nogui ~/.ssh/id_dsa
#     [ -f ~/.ssh/id_rsa ] && /usr/bin/keychain --nogui ~/.ssh/id_rsa
    fi
done
[ -f ~/.keychain/$HOSTNAME-sh ] && source ~/.keychain/$HOSTNAME-sh > /dev/null



cf_date_check_notify
alias reloadhosts="sudo niload -v -m hosts ."
alias ls='ls $LS_OPTIONS -hF'
eval `dircolors ~/DIR_COLORS`
export LS_OPTIONS='--color=auto'
    


cf_check_for_updates

# Ruby Enterprise Edition
alias rakeEE="/opt/ruby-enterprise-1.8.7-2010.01/bin/rake"
alias gemEE="/opt/ruby-enterprise-1.8.7-2010.01/bin/gem"
alias rubyEE="/opt/ruby-enterprise-1.8.7-2010.01/bin/ruby"
alias irbEE="/opt/ruby-enterprise-1.8.7-2010.01/bin/irb"

#testing
