require_dependency 'journal'

module RedmineGitHosting
  module Patches
    module JournalPatch

      def self.included(base)
        base.class_eval do
          has_one :github_comment, foreign_key: 'journal_id', class_name: 'GithubComment', dependent: :destroy
        end
      end

    end
  end
end

unless Journal.included_modules.include?(RedmineGitHosting::Patches::JournalPatch)
  Journal.send(:include, RedmineGitHosting::Patches::JournalPatch)
end
