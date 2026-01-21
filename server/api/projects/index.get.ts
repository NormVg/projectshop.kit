import { serverSupabaseClient } from '#supabase/server'

export default defineEventHandler(async (event) => {
  const client = await serverSupabaseClient(event)

  // Get query params for filtering
  const query = getQuery(event)
  const category = query.category as string | undefined
  const badge = query.badge as string | undefined
  const limit = query.limit ? parseInt(query.limit as string) : undefined

  let queryBuilder = client
    .from('projects')
    .select('*')
    .eq('is_active', true)

  // Apply filters
  if (category) {
    queryBuilder = queryBuilder.eq('category', category)
  }

  if (badge) {
    queryBuilder = queryBuilder.eq('badge', badge)
  }

  // Order by created_at
  queryBuilder = queryBuilder.order('created_at', { ascending: false })

  // Apply limit
  if (limit) {
    queryBuilder = queryBuilder.limit(limit)
  }

  const { data, error } = await queryBuilder

  if (error) {
    throw createError({
      statusCode: 500,
      statusMessage: 'Failed to fetch projects',
    })
  }

  return data || []
})
